class SignInState {}

class SignInInitializingState extends SignInState {}

class SignInLoggedState extends SignInState {
  final String email;

  SignInLoggedState(this.email);
}

class SignInNotLoggedState extends SignInState {}

class SignInErrorState extends SignInState {}