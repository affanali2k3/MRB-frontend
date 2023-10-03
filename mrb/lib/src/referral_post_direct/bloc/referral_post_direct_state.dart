import 'package:equatable/equatable.dart';
import 'package:mrb/src/referral_post_direct/model/agent_model.dart';

abstract class ReferralPostDirectState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ReferralPostDirectInitialState extends ReferralPostDirectState {}

final class ReferralPostDirectTopAgentsState extends ReferralPostDirectState {}

final class ReferralPostDirectYourNetworkState
    extends ReferralPostDirectState {}

final class ReferralPostDirectTopAgentsLoadingState
    extends ReferralPostDirectTopAgentsState {}

final class ReferralPostDirectTopAgentsSuccessState
    extends ReferralPostDirectTopAgentsState {
  ReferralPostDirectTopAgentsSuccessState({required this.agents});
  final List<AgentModel> agents;
}

final class ReferralPostDirectTopAgentsFailedState
    extends ReferralPostDirectTopAgentsState {}

final class ReferralPostDirectYourNetworkLoadingState
    extends ReferralPostDirectYourNetworkState {}

final class ReferralPostDirectYourNetworkSuccessState
    extends ReferralPostDirectYourNetworkState {
  ReferralPostDirectYourNetworkSuccessState({required this.agents});
  final List<AgentModel> agents;
}

final class ReferralPostDirectYourNetworkFailedState
    extends ReferralPostDirectYourNetworkState {}
