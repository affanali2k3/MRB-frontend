part of 'referral_apply_bloc_bloc.dart';

sealed class ReferralApplyState {
  const ReferralApplyState();
}

final class ReferralApplyInitialState extends ReferralApplyState {}

final class ReferralApplyLoadingState extends ReferralApplyState {}

final class ReferralApplyFailedState extends ReferralApplyState {
  ReferralApplyFailedState({required this.error});
  final String error;
}

final class ReferralApplySuccessState extends ReferralApplyState {}
