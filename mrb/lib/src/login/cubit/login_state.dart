import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginLoggedOutState extends LoginState {}

class LoginInvalidEmailState extends LoginState {
  LoginInvalidEmailState({required this.error});
  final String error;

  @override
  List<Object> get props => [error];
}

class LoginSuccessState extends LoginState {}

class LoginInvalidPasswordState extends LoginState {
  LoginInvalidPasswordState({required this.error});
  final String error;

  @override
  List<Object> get props => [error];
}
