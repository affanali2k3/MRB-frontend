import 'package:equatable/equatable.dart';

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
    extends ReferralPostDirectTopAgentsState {}

final class ReferralPostDirectTopAgentsFailedState
    extends ReferralPostDirectTopAgentsState {}

final class ReferralPostDirectYourNetworkLoadingState
    extends ReferralPostDirectYourNetworkState {}

final class ReferralPostDirectYourNetworkSuccessState
    extends ReferralPostDirectYourNetworkState {}

final class ReferralPostDirectYourNetworkFailedState
    extends ReferralPostDirectYourNetworkState {}
