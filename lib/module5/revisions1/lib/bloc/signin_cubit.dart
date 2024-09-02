import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:revisions1/bloc/sigin_states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInCubit extends Cubit<SignInState> {
  final SharedPreferences preferences;

  SignInCubit(this.preferences) : super(SignInInitializingState()) {
    // lire en local si l'utilisateur est déjà loggé
    _initialize();
  }

  void _initialize() async {
    await Future.delayed(const Duration(seconds: 2));

    final logged = preferences.getBool("logged") ?? false;
    final email = preferences.getString("email");

    if (logged && email != null) {
      emit(SignInLoggedState(email));
    } else {
      emit(SignInNotLoggedState());
    }
  }

  void signIn() async {
    final currentState = state;

    try {
      // connexion à Google
      final account = await GoogleSignIn().signIn();

      if (account == null) return;
      // Envoi des données à Firebase
      final authentication = await account.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: authentication.accessToken,
        idToken: authentication.idToken
      );
      await FirebaseAuth.instance.signInWithCredential(credential);

      // sauvegarde des infos en local
      preferences.setBool("logged", true);
      preferences.setString("email", account.email);

      emit(SignInLoggedState(account.email));
    } catch (error, trace) {
      print('$error\n$trace');
      emit(SignInErrorState());
      emit(currentState);
    }
  }

  void signOut() async {
    final currentState = state;

    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      await preferences.clear();
      emit(SignInNotLoggedState());
    } catch (error, trace) {
      print('$error\n$trace');
      emit(SignInErrorState());
      emit(currentState);
    }
  }
}