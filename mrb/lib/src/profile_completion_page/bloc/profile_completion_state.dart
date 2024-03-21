part of 'profile_completion_bloc.dart';

enum ProfileCompletionPageErrorTypes {
  backend,
  stateNotSelected,
  yearNotSelected,
  termsNotAccepted
}

@immutable
sealed class ProfileCompletionState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ProfileCompletionInitialState extends ProfileCompletionState {}

final class ProfileCompletionLoadingState extends ProfileCompletionState {}

final class ProfileCompletionSuccessState extends ProfileCompletionState {
  @override
  List<Object?> get props => [];
}

final class ProfileCompletionFailedState extends ProfileCompletionState {
  ProfileCompletionFailedState({required this.error, required this.type});
  final ProfileCompletionPageErrorTypes type;
  final String error;
  @override
  List<Object?> get props => [error];
}
