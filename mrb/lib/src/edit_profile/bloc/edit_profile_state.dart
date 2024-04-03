import 'package:equatable/equatable.dart';

abstract class ProfileEditState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileEditInitialState extends ProfileEditState {}

class ProfileEditLoadingState extends ProfileEditState {}

class ProfileEditSuccessState extends ProfileEditState {}

class ProfileEditFailedState extends ProfileEditState {
  ProfileEditFailedState({required this.error});
  final String error;
}
