import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginLoginEvent extends LoginEvent {
  LoginLoginEvent({required this.email, required this.password});
  final String email;
  final String password;
}

class LoginGetUserEvent extends LoginEvent {}

class LoginGoogleLoginEvent extends LoginEvent {}

class LoginLogoutEvent extends LoginEvent {}

class ChangeLoginEvent extends LoginEvent {}

class ChangeLogoutEvent extends LoginEvent {}
