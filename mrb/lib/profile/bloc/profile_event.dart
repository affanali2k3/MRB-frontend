import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfileAddAvatarEvent extends ProfileEvent {}

class ProfileLogoutEvent extends ProfileEvent {}

class ProfileInitialEvent extends ProfileEvent {
  ProfileInitialEvent(
      {required this.name,
      required this.ssn,
      required this.licence,
      required this.profilePhoto,
      required this.phone,
      required this.occupation,
      required this.gender});
  final String name;
  final String ssn;
  final String licence;
  final String profilePhoto;
  final String phone;
  final String occupation;
  final String gender;
}

class ProfileSetEvent extends ProfileEvent {
  ProfileSetEvent(
      {required this.name,
      required this.ssn,
      required this.licence,
      required this.phone,
      required this.occupation,
      required this.gender});
  final String name;
  final String ssn;
  final String licence;
  final String phone;
  final String occupation;
  final String gender;
}
