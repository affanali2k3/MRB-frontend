import 'package:equatable/equatable.dart';

abstract class AgentFormsReceivedEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AgentFormsReceivedLoadingEvent extends AgentFormsReceivedEvent {}

final class AgentFormsReceivedProposalEvent extends AgentFormsReceivedEvent {
  AgentFormsReceivedProposalEvent(
      {required this.proposal, required this.senderAgentFormId});
  final String proposal;
  final int senderAgentFormId;
}
