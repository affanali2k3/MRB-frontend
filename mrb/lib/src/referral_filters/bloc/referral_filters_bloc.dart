import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/referral_centre/model/user_preference_model.dart';
import 'package:mrb/src/referral_filters/bloc/referral_filters_event.dart';
import 'package:mrb/src/referral_filters/bloc/referral_filters_state.dart';
import 'package:mrb/src/referral_filters/repository/referral_filters_repository.dart';

class ReferralFiltersBloc
    extends Bloc<ReferralFiltersEvent, ReferralFiltersState> {
  ReferralFiltersBloc({required this.repository})
      : super(ReferralFiltersInitialState()) {
    on<ReferralFiltersChangeClientTypeEvent>(_changeClientType);
    on<ReferralFiltersChangeHouseTypeEvent>(_changeHouseType);
    on<ReferralFiltersApplyFilterEvent>(_applyFilters);
  }

  final ReferralFiltersRepository repository;

  void _changeClientType(ReferralFiltersChangeClientTypeEvent event, emit) {
    emit(ReferralFiltersChangedState(
        clientType: event.clientType, houseType: state.houseType));
  }

  void _changeHouseType(ReferralFiltersChangeHouseTypeEvent event, emit) {
    emit(ReferralFiltersChangedState(
        clientType: state.clientType, houseType: event.houseType));
  }

  void _applyFilters(ReferralFiltersApplyFilterEvent event, emit) async {
    try {
      GlobalVariables.preferences = UserPreferenceModel(
          state: event.state,
          city: event.city,
          clientType: state.clientType.name,
          houseType: state.houseType,
          maxCost: event.maxCost,
          maxTimeAmount: event.maxTime,
          minCost: event.minCost,
          minTimeAmount: event.minTime,
          userId: GlobalVariables.user.id);

      final Response response = await repository.updatePreferences(
          minTimeAmount: event.minTime,
          maxTimeAmount: event.maxTime,
          minCost: event.minCost,
          maxCost: event.maxCost,
          clientType: state.clientType.name,
          typeOfHouse: state.houseType,
          state: event.state,
          userId: GlobalVariables.user.id,
          city: event.city);

      print(response.body);

      final Map<String, dynamic> jsonResult =
          json.decode(response.body)['data'];

      final UserPreferenceModel userPreferenceModel =
          UserPreferenceModel.fromJson(jsonResult);

      print(userPreferenceModel);
    } catch (e) {
      print(e);
    }
  }
}
