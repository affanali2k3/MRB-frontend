import 'package:equatable/equatable.dart';

abstract class ReferralCentreEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ReferralCentreLoadingEvent extends ReferralCentreEvent {
  ReferralCentreLoadingEvent({required this.city, required this.state});
  final String? city;
  final String? state;
}

final class ReferralCentreApplyLeadEvent extends ReferralCentreEvent {
  ReferralCentreApplyLeadEvent(
      {required this.receiverAgent,
      required this.senderAgentFormId,
      required this.proposal});
  final int receiverAgent;
  final int senderAgentFormId;
  final String proposal;
}
