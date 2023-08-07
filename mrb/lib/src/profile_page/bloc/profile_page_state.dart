import 'package:equatable/equatable.dart';
import 'package:mrb/src/edit_profile/model/deal_model.dart';
import 'package:mrb/src/profile_page/model/user_association_model.dart';

abstract class ProfilePageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfilePageLoadingState extends ProfilePageState {}

class ProfilePageIsFriendState extends ProfilePageState {}

class ProfilePageSuccessState extends ProfilePageState {
  ProfilePageSuccessState(
      {required this.ssn,
      required this.associationStatus,
      required this.email,
      required this.name,
      required this.licence,
      required this.photo,
      required this.phone,
      required this.address,
      required this.completedDeals,
      required this.licenceState,
      required this.licenceNumber,
      required this.yearLicenced,
      required this.previousDeals,
      required this.occupation,
      required this.gender});
  final UserAssociationModel? associationStatus;
  final String? ssn;
  final String? email;
  final String? name;
  final String? licence;
  final String? photo;
  final String? phone;
  final String? occupation;
  final String? gender;
  final String? licenceState;
  final String? licenceNumber;
  final String? yearLicenced;
  final String? completedDeals;
  final String? address;
  final List<Deal>? previousDeals;

  @override
  List<Object?> get props => [
        ssn,
        associationStatus,
        completedDeals,
        licenceNumber,
        licenceState,
        address,
        previousDeals,
        completedDeals,
        email,
        name,
        licence,
        photo,
        phone,
        occupation,
        gender
      ];
}
