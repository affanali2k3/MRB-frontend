enum LoginPageErrors {
  invalidEmailFormat,
  invalidPassword,
  userNotFound,
  googleLoginError,
  other
}

enum LoginTypes { email, google }

abstract class LoginState {}

class LoginLoggedOutState extends LoginState {}

class LoginUserNotExistState extends LoginState {}

class LoginSuccessState extends LoginState {
  LoginSuccessState({required this.type});
  final LoginTypes type;
}

class LoginFailedState extends LoginState {
  LoginFailedState({required this.error, required this.type});
  final String error;
  final LoginPageErrors type;
}

class LoginGettingDataState extends LoginState {}

class LoginSuccessfullyGotDataState extends LoginState {}

class LoginFailedGettingDataState extends LoginState {
  LoginFailedGettingDataState({required this.error});
  final String error;
}
