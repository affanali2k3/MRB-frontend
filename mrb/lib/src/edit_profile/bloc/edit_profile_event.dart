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
      required this.coverPhotoBytes,
      required this.coverPhotoMimeType});
  final String biography;

  final String? avatarMimeType;
  final Uint8List? avatarbytes;

  final String? coverPhotoMimeType;
  final Uint8List? coverPhotoBytes;
}
