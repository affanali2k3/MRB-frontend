import 'package:equatable/equatable.dart';
import 'package:mrb/src/edit_profile/model/deal_model.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfileAddAvatarEvent extends ProfileEvent {}

class ProfileLogoutEvent extends ProfileEvent {}

class ProfileSetEvent extends ProfileEvent {
  ProfileSetEvent(
      {required this.name,
      required this.ssn,
      required this.licence,
      required this.phone,
      required this.occupation,
      required this.gender,
      required this.licenceNumber,
      required this.licenceState,
      required this.address,
      required this.numberOfCompletedDeals,
      this.previousDeals,
      required this.yearLicenced});
  final String name;
  final String ssn;
  final String licence;
  final String phone;
  final String address;
  final String occupation;
  final String gender;
  final String licenceState;
  final String licenceNumber;
  final String yearLicenced;
  final String numberOfCompletedDeals;
  final List<Deal>? previousDeals;
}
