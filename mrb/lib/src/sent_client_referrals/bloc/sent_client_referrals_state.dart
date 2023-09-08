import 'package:equatable/equatable.dart';
import 'package:mrb/src/agent_forms_received/model/form_model.dart';

abstract class SentClientReferralsState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SentClientReferralsInitialState extends SentClientReferralsState {}

final class SentClientReferralsLoadingState extends SentClientReferralsState {}

final class SentClientReferralsDirectSuccessState
    extends SentClientReferralsState {
  SentClientReferralsDirectSuccessState({required this.directReferralsSent});
  final List<FormReceivedModel> directReferralsSent;
}

final class SentClientReferralsOpenSuccessState
    extends SentClientReferralsState {
  SentClientReferralsOpenSuccessState({required this.openReferralsSent});
  final List<FormReceivedModel> openReferralsSent;
}

final class SentClientReferralsDirectFailedState
    extends SentClientReferralsState {
  SentClientReferralsDirectFailedState({required this.error});
  final String error;
}

final class SentClientReferralsOpenFailedState
    extends SentClientReferralsState {
  SentClientReferralsOpenFailedState({required this.error});
  final String error;
}
