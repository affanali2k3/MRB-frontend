import 'package:equatable/equatable.dart';

abstract class ProfilePageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfilePageLoadingState extends ProfilePageState {}

class ProfilePageSuccessState extends ProfilePageState {
  ProfilePageSuccessState(
      {required this.ssn,
      required this.email,
      required this.name,
      required this.licence,
      required this.photo,
      required this.phone,
      required this.occupation,
      required this.gender});
  final String ssn;
  final String email;
  final String name;
  final String licence;
  final String photo;
  final String phone;
  final String occupation;
  final String gender;
}
