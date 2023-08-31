import 'package:equatable/equatable.dart';
import 'package:mrb/src/referral_centre/model/leads_model.dart';

abstract class ReferralCentreState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ReferralCentreInitialState extends ReferralCentreState {}

final class ReferralCentreLoadingState extends ReferralCentreState {}

final class ReferralCentreSuccessState extends ReferralCentreState {
  ReferralCentreSuccessState({required this.leads});
  final List<LeadModel> leads;

  @override
  List<Object?> get props => [leads];
}

final class ReferralCentreFailedState extends ReferralCentreState {
  ReferralCentreFailedState({required this.error});
  final String error;

  @override
  List<Object?> get props => [error];
}
