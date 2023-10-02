import 'package:equatable/equatable.dart';
import 'package:mrb/src/referral_post/bloc/referral_post_state.dart';

enum ClientType { buyer, seller }

abstract class ReferralFiltersState extends Equatable {
  const ReferralFiltersState(
      {this.clientType = ClientType.buyer,
      this.houseType = HouseTypes.singleFamily});
  final ClientType clientType;
  final String houseType;

  @override
  List<Object?> get props => [clientType, houseType];
}

final class ReferralFiltersInitialState extends ReferralFiltersState {}

final class ReferralFiltersChangedState extends ReferralFiltersState {
  const ReferralFiltersChangedState({super.clientType, super.houseType});
}
