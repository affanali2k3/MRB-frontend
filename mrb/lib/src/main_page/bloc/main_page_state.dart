import 'package:equatable/equatable.dart';

abstract class MainPageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MainPageInitialState extends MainPageState {}

class LoginPageState extends MainPageState {}

class ProfilePageState extends MainPageState {}

class RegistorPageState extends MainPageState {}

class ProfileEditPageState extends MainPageState {}
