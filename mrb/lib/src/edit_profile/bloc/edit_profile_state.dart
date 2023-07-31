import 'dart:typed_data';

import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState({
    this.mimeType,
    this.bytes,
    required this.name,
    required this.ssn,
    required this.phone,
    required this.occupation,
    required this.gender,
    required this.licence,
  });
  final String? mimeType;
  final Uint8List? bytes;
  final String name;
  final String ssn;
  final String licence;
  final String phone;
  final String occupation;
  final String gender;
  @override
  List<Object?> get props =>
      [mimeType, bytes, name, ssn, licence, phone, occupation, gender];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial({
    required super.name,
    required super.ssn,
    required super.phone,
    required super.occupation,
    required super.gender,
    required super.licence,
  });
}

class ProfileSetAvatarState extends ProfileState {
  const ProfileSetAvatarState({
    super.mimeType,
    super.bytes,
    required super.name,
    required super.ssn,
    required super.phone,
    required super.occupation,
    required super.gender,
    required super.licence,
  });
}
