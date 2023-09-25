import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/assets/us_states.dart';
import 'package:mrb/src/referral_post/bloc/referral_post_event.dart';
import 'package:mrb/src/referral_post/bloc/referral_post_state.dart';
import 'package:mrb/src/referral_post/repository/referral_post_repository.dart';

class ReferralPostBloc extends Bloc<ReferralPostEvent, ReferralPostState> {
  ReferralPostBloc({required this.repository})
      : super(ReferralPostInitialState()) {
    on<ReferralPostChangeIsBuyerEvent>(_changeIsBuyer);
    on<ReferralPostChangeHouseTypeEvent>(_changeHouseType);
    on<ReferralPostChangeStateEvent>(_changeState);
    on<ReferralPostChangeCityEvent>(_changeCity);
    on<ReferralPostChangeFormTypeEvent>(_changeFormType);
    on<ReferralPostOpenFormPostEvent>(_openFormPost);
  }

  final ReferralPostRepository repository;

  void _openFormPost(ReferralPostOpenFormPostEvent event, emit) async {
    try {
      await repository.createOpenForm(
          city: event.city,
          state: event.state,
          isBuyer: event.isBuyer,
          price: event.price,
          houseType: event.houseType,
          formType: event.formType,
          timeAmount: event.timeAmount);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _changeIsBuyer(ReferralPostChangeIsBuyerEvent event, emit) {
    emit(ReferralPostChangedState(
        isBuyer: event.isBuyer,
        formType: state.formType,
        houseType: state.houseType,
        state: state.state,
        city: state.city));
  }

  void _changeHouseType(ReferralPostChangeHouseTypeEvent event, emit) {
    emit(ReferralPostChangedState(
        houseType: event.houseType,
        isBuyer: state.isBuyer,
        formType: state.formType,
        state: state.state,
        city: state.city));
  }

  void _changeState(ReferralPostChangeStateEvent event, emit) {
    emit(ReferralPostChangedState(
        houseType: state.houseType,
        isBuyer: state.isBuyer,
        state: event.state,
        formType: state.formType,
        city: usStatesAndCities[event.state]!.first));
  }

  void _changeCity(ReferralPostChangeCityEvent event, emit) {
    emit(ReferralPostChangedState(
        houseType: state.houseType,
        isBuyer: state.isBuyer,
        formType: state.formType,
        state: state.state,
        city: event.city));
  }

  void _changeFormType(ReferralPostChangeFormTypeEvent event, emit) {
    emit(ReferralPostChangedState(
        houseType: state.houseType,
        isBuyer: state.isBuyer,
        formType: event.formType,
        state: state.state,
        city: state.city));
  }
}
