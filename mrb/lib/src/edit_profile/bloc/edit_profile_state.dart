import 'dart:typed_data';

import 'package:equatable/equatable.dart';

abstract class ProfileEditState extends Equatable {
  final String? avatarMimeType;
  final Uint8List? avatarbytes;

  final String? coverPhotoMimeType;
  final Uint8List? coverPhotoBytes;

  const ProfileEditState(
      {this.avatarMimeType,
      this.avatarbytes,
      this.coverPhotoBytes,
      this.coverPhotoMimeType});

  @override
  List<Object?> get props =>
      [avatarMimeType, avatarbytes, coverPhotoBytes, coverPhotoMimeType];
}

class ProfileEditInitialState extends ProfileEditState {}

class ProfileEditSetSuccessState extends ProfileEditState {}

class ProfileEditSetLoadingState extends ProfileEditState {}

class ProfileEditSetFailureState extends ProfileEditState {
  ProfileEditSetFailureState({required this.error});
  final String error;
}
