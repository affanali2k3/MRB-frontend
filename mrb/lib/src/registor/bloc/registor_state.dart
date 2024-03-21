import 'package:equatable/equatable.dart';

abstract class RegistorState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegistorInitialState extends RegistorState {}

class RegistorSuccessState extends RegistorState {}

class RegistorFailedState extends RegistorState {
  RegistorFailedState({required this.error, required this.type});
  final String error;
  final String type;
}

// class RegistorWrongEmailState extends RegistorState {
//   RegistorWrongEmailState({required this.error});
//   final String error;
// }

// class RegistorWrongPasswordState extends RegistorState {
//   RegistorWrongPasswordState({required this.error});
//   final String error;
// }
