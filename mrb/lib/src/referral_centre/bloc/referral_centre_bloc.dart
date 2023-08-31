import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_event.dart';
import 'package:mrb/src/referral_centre/bloc/referral_centre_state.dart';
import 'package:mrb/src/referral_centre/model/leads_model.dart';
import 'package:mrb/src/referral_centre/repository/referral_centre_repository.dart';

class ReferralCentreBloc
    extends Bloc<ReferralCentreEvent, ReferralCentreState> {
  ReferralCentreBloc({required this.repository})
      : super(ReferralCentreInitialState()) {
    on<ReferralCentreLoadingEvent>(_searchDefaultLeads);
  }

  final ReferralCentreRepository repository;

  void _searchDefaultLeads(ReferralCentreLoadingEvent event, emit) async {
    try {
      print('a');
      final Response response = await repository.searchDefaultLeads(
          state: event.state, city: event.city);
      print(response.body);

      final List<dynamic> leadsJson = json.decode(response.body)['data'];

      final List<LeadModel> leads = [];

      for (final lead in leadsJson) {
        leads.add(LeadModel.fromJson(lead));
      }

      emit(ReferralCentreSuccessState(leads: leads));
    } catch (e) {
      emit(ReferralCentreFailedState(error: e.toString()));
    }
  }
}
