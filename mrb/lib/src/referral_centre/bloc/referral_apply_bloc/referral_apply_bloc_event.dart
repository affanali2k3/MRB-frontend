part of 'referral_apply_bloc_bloc.dart';

sealed class ReferralApplyEvent extends Equatable {
  const ReferralApplyEvent();

  @override
  List<Object> get props => [];
}

final class ReferralApplyLeadEvent extends ReferralApplyEvent {
  const ReferralApplyLeadEvent(
      {required this.receiverAgent,
      required this.senderAgentFormId,
      required this.proposal});
  final int receiverAgent;
  final int senderAgentFormId;
  final String proposal;
}
