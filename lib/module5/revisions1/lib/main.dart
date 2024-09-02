import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revisions1/bloc/local_status_cubit.dart';
import 'package:revisions1/bloc/signin_cubit.dart';
import 'package:revisions1/bloc/status_cubit.dart';
import 'package:revisions1/firebase_options.dart';
import 'package:revisions1/screens/sign_in.dart';
import 'package:revisions1/services/local_status_service.dart';
import 'package:revisions1/services/status_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(MyApp(preferences: sharedPreferences));
}

class MyApp extends StatelessWidget {
  static const primaryColor = Color(0xFF075E54);

  final SharedPreferences preferences;

  const MyApp({super.key, required this.preferences});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInCubit(preferences),
      child: BlocProvider(
        create: (_) => NewStatusCubit(StatusService()),
        child: BlocProvider(
          create: (_) => LocalNewStatusCubit(LocalStatusService()),
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: const ColorScheme.light(
                primary: primaryColor
              ),
              useMaterial3: true,
            ),
            home: const SignInPage(),
          ),
        ),
      ),
    );
  }
}

