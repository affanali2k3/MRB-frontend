import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/src/referral_post/bloc/referral_post_event.dart';
import 'package:mrb/src/referral_post/bloc/referral_post_state.dart';

class ReferralPostBloc extends Bloc<ReferralPostEvent, ReferralPostState> {
  ReferralPostBloc() : super(ReferralPostInitialState()) {
    on<ReferralPostChangeIsBuyerEvent>(_changeIsBuyer);
    on<ReferralPostChangeHouseTypeEvent>(_changeHouseType);
  }

  void _changeIsBuyer(ReferralPostChangeIsBuyerEvent event, emit) {
    emit(ReferralPostChangedState(
        isBuyer: event.isBuyer, houseType: state.houseType));
  }

  void _changeHouseType(ReferralPostChangeHouseTypeEvent event, emit) {
    emit(ReferralPostChangedState(
        houseType: event.houseType, isBuyer: state.isBuyer));
  }
}
