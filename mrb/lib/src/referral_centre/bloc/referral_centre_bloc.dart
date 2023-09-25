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
    on<ReferralCentreApplyLeadEvent>(_applyForLead);
  }

  final ReferralCentreRepository repository;

  void _searchDefaultLeads(ReferralCentreLoadingEvent event, emit) async {
    try {
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

  void _applyForLead(ReferralCentreApplyLeadEvent event, emit) async {
    try {
      print(event.proposal);
      final Response response = await repository.applyForLead(
          senderAgentFormId: event.senderAgentFormId,
          receiverAgentId: event.receiverAgent,
          proposal: event.proposal);
      print(response.body);
    } catch (e) {
      emit(ReferralCentreFailedState(error: e.toString()));
    }
  }
}
