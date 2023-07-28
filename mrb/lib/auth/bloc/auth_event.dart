import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthLoginEvent extends AuthEvent {
  AuthLoginEvent({required this.email, required this.password});
  final String email;
  final String password;
}

class AuthLogoutEvent extends AuthEvent {}
