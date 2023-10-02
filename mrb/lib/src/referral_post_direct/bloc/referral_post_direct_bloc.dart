import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mrb/src/referral_post_direct/bloc/referral_post_direct_event.dart';
import 'package:mrb/src/referral_post_direct/bloc/referral_post_direct_state.dart';
import 'package:mrb/src/referral_post_direct/model/agent_model.dart';
import 'package:mrb/src/referral_post_direct/repository/referral_post_direct_repository.dart';

class ReferralPostDirectBloc
    extends Bloc<ReferralPostDirectEvent, ReferralPostDirectState> {
  ReferralPostDirectBloc({required this.repository})
      : super(ReferralPostDirectInitialState()) {
    on<ReferralPostDirectChangeTabEvent>(_changeTab);
    on<ReferralPostDirectTopAgentsLoadingEvent>(_loadTopAgents);
    on<ReferralPostDirectYourNetworkLoadingEvent>(_loadNetworkAgents);
  }

  final ReferralPostDirectRepository repository;

  void _loadTopAgents(
      ReferralPostDirectTopAgentsLoadingEvent event, emit) async {
    try {
      emit(ReferralPostDirectTopAgentsLoadingState());

      final Response response = await repository.loadTopAgents();

      print(response.body);

      final List<dynamic> responseJson = json.decode(response.body)['data'];

      final List<AgentModel> topAgents = [];

      print(topAgents);

      for (final Map<String, dynamic> json in responseJson) {
        topAgents.add(AgentModel.fromJson(json));
      }
      print(topAgents);
    } catch (e) {
      print(e);
      emit(ReferralPostDirectTopAgentsFailedState());
    }
  }

  void _loadNetworkAgents(
      ReferralPostDirectYourNetworkLoadingEvent event, emit) async {
    try {
      emit(ReferralPostDirectTopAgentsLoadingState());

      final Response response = await repository.loadTopAgents();

      final List<dynamic> responseJson = json.decode(response.body)['data'];

      final List<AgentModel> topAgents = [];

      for (final Map<String, dynamic> json in responseJson) {}
    } catch (e) {
      emit(ReferralPostDirectTopAgentsFailedState());
    }
  }

  void _changeTab(ReferralPostDirectChangeTabEvent event, emit) {
    if (event.tab == PostDirectTab.topAgents) {
      emit(ReferralPostDirectTopAgentsLoadingState());
    } else if (event.tab == PostDirectTab.yourNetwork) {
      emit(ReferralPostDirectYourNetworkLoadingState());
    }
  }
}
