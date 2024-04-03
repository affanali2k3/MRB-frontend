import 'dart:typed_data';

import 'package:equatable/equatable.dart';

abstract class ProfileEditEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfileEditAddAvatarEvent extends ProfileEditEvent {}

class ProfileEditLogoutEvent extends ProfileEditEvent {}

class ProfileEditSetEvent extends ProfileEditEvent {
  ProfileEditSetEvent(
      {required this.biography,
      required this.avatarMimeType,
      required this.avatarbytes,
      required this.address,
      required this.licenseNumber,
      required this.licenseState,
      required this.licenseYear,
      required this.name,
      required this.phone});
  final String biography;

  final String name;
  final String phone;
  final String address;
  final String? licenseState;
  final String licenseNumber;
  final int? licenseYear;

  final String? avatarMimeType;
  final Uint8List? avatarbytes;
}
