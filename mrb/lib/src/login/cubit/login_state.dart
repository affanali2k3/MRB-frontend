abstract class LoginState {}

class LoginLoggedOutState extends LoginState {}

class LoginUserNotExistState extends LoginState {}

class LoginInvalidEmailState extends LoginState {
  LoginInvalidEmailState({required this.error});
  final String error;
}

class LoginSuccessState extends LoginState {}

class LoginInvalidPasswordState extends LoginState {
  LoginInvalidPasswordState({required this.error});
  final String error;
}

class LoginFailedState extends LoginState {}

class LoginGettingDataState extends LoginState {}

class LoginSuccessfullyGotDataState extends LoginState {}

class LoginFailedGettingDataState extends LoginState {
  LoginFailedGettingDataState({required this.error});
  final String error;
}
