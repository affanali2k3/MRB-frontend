import 'package:equatable/equatable.dart';
import 'package:mrb/src/profile_page/model/user_association_model.dart';

abstract class ProfilePageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfilePageLoadingState extends ProfilePageState {}

class ProfilePageIsFriendState extends ProfilePageState {}

class ProfilePageSuccessState extends ProfilePageState {
  ProfilePageSuccessState(
      {required this.associationStatus,
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
      required this.occupation,
      required this.gender});
  final UserAssociationModel? associationStatus;
  final String? email;
  final String? name;
  final String? licence;
  final String? photo;
  final String? phone;
  final String? occupation;
  final String? gender;
  final String? licenceState;
  final String? licenceNumber;
  final int? yearLicenced;
  final int? completedDeals;
  final String? address;

  @override
  List<Object?> get props => [
        associationStatus,
        completedDeals,
        licenceNumber,
        licenceState,
        address,
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
