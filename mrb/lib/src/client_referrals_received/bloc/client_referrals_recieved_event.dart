import 'package:equatable/equatable.dart';

abstract class ClientReferralsRecievedEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ClientReferralsRecievedLoadingEvent
    extends ClientReferralsRecievedEvent {}

final class ClientReferralsRecievedProposalEvent
    extends ClientReferralsRecievedEvent {
  ClientReferralsRecievedProposalEvent(
      {required this.proposal, required this.senderAgentFormId});
  final String proposal;
  final int senderAgentFormId;
}
