import 'package:equatable/equatable.dart';

class UserTimelineState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserTimelineLoadingState extends UserTimelineState {}

class UserTimelineSuccessState extends UserTimelineInitialState {
  UserTimelineSuccessState({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

class UserTimelineFailureState extends UserTimelineInitialState {
  UserTimelineFailureState({required this.error});
  final String error;

  @override
  List<Object?> get props => [error];
}

class UserTimelineInitialState extends UserTimelineState {}
