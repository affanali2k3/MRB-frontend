import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mrb/src/agent_open_forms_sent/bloc/agent_forms_received_event.dart';
import 'package:mrb/src/agent_open_forms_sent/bloc/agent_forms_received_state.dart';
import 'package:mrb/src/agent_open_forms_sent/model/form_model.dart';
import 'package:mrb/src/agent_open_forms_sent/repository/agent_forms_received_repository.dart';

class AgentOpenFormsSentBloc
    extends Bloc<AgentOpenFormsSentEvent, AgentOpenFormsSentState> {
  AgentOpenFormsSentBloc({required this.repository})
      : super(AgentOpenFormsSentInitialState()) {
    on<AgentOpenFormsSentLoadingEvent>(_getOpenFormsSent);
  }
  final AgentOpenFormsSentRepository repository;

  void _getOpenFormsSent(AgentOpenFormsSentLoadingEvent event, emit) async {
    try {
      emit(AgentOpenFormsSentLoadingState());
      final Response response =
          await repository.getOpenFormsSent(userEmail: event.userEmail);

      final Map<String, dynamic> decodedData = json.decode(response.body);

      print(decodedData);

      final String responseMessage = decodedData['message'];
      final List<dynamic> sentFormsJson = decodedData['data'];

      final List<SentFormModel> sentForms = [];

      for (final Map<String, dynamic> json in sentFormsJson) {
        sentForms.add(SentFormModel.fromJson(json));
      }

      print(sentForms);

      emit(AgentOpenFormsSentSuccessState(
          sentForms: sentForms, message: responseMessage));
    } catch (e) {
      emit(AgentOpenFormsSentFailedState(error: e.toString()));
    }
  }
}
