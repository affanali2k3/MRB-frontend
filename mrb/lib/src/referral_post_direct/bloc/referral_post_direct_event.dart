import 'package:equatable/equatable.dart';
import 'package:mrb/src/referral_filters/bloc/referral_filters_state.dart';
import 'package:mrb/src/sender_agent_form/bloc/sender_agent_form_state.dart';

enum PostDirectTab { topAgents, yourNetwork }

abstract class ReferralPostDirectEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ReferralPostDirectChangeTabEvent extends ReferralPostDirectEvent {
  ReferralPostDirectChangeTabEvent({required this.tab});
  final PostDirectTab tab;
  @override
  List<Object?> get props => [];
}

final class ReferralPostDirectTopAgentsLoadingEvent
    extends ReferralPostDirectEvent {
  ReferralPostDirectTopAgentsLoadingEvent(
      {required this.state, required this.clientType});
  final String state;
  final ClientType clientType;
}

final class ReferralPostSendReferralToAgentEvent
    extends ReferralPostDirectEvent {
  ReferralPostSendReferralToAgentEvent({
    required this.senderAgent,
    required this.city,
    required this.desiredDate,
    required this.clientType,
    required this.formType,
    required this.price,
    required this.receiverAgent,
    required this.state,
  });
  final int senderAgent;
  final int receiverAgent;
  final FormType formType;
  final ClientType clientType;
  final String city;
  final String state;
  final double price;
  final DateTime desiredDate;
}

final class ReferralPostDirectYourNetworkLoadingEvent
    extends ReferralPostDirectEvent {
  ReferralPostDirectYourNetworkLoadingEvent(
      {required this.state, required this.clientType});
  final String state;
  final ClientType clientType;
}
