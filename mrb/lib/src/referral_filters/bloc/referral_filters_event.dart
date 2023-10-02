import 'package:equatable/equatable.dart';
import 'package:mrb/src/referral_filters/bloc/referral_filters_state.dart';

abstract class ReferralFiltersEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ReferralFiltersChangeClientTypeEvent extends ReferralFiltersEvent {
  ReferralFiltersChangeClientTypeEvent({required this.clientType});
  final ClientType clientType;
}

final class ReferralFiltersChangeHouseTypeEvent extends ReferralFiltersEvent {
  ReferralFiltersChangeHouseTypeEvent({required this.houseType});
  final String houseType;
}

final class ReferralFiltersApplyFilterEvent extends ReferralFiltersEvent {
  ReferralFiltersApplyFilterEvent(
      {required this.maxCost,
      required this.city,
      required this.maxTime,
      required this.minCost,
      required this.minTime,
      required this.state});
  final int minTime;
  final int maxTime;

  final int minCost;
  final int maxCost;

  final String state;
  final String city;
}
