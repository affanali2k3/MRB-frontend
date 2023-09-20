import 'package:equatable/equatable.dart';

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
    extends ReferralPostDirectEvent {}

final class ReferralPostDirectYourNetworkLoadingEvent
    extends ReferralPostDirectEvent {}
