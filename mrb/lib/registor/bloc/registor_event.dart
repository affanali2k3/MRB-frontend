import 'package:equatable/equatable.dart';

abstract class RegistorEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegistorSignUpEvent extends RegistorEvent {
  RegistorSignUpEvent({required this.email, required this.password});
  final String email;
  final String password;
}
