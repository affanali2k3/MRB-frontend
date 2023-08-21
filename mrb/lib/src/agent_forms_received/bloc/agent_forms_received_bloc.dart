import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mrb/src/agent_forms_received/bloc/agent_forms_received_event.dart';
import 'package:mrb/src/agent_forms_received/bloc/agent_forms_received_state.dart';
import 'package:mrb/src/agent_forms_received/model/form_model.dart';
import 'package:mrb/src/agent_forms_received/repository/agent_forms_received_repository.dart';

class AgentFormsReceivedBloc
    extends Bloc<AgentFormsReceivedEvent, AgentFormsReceivedState> {
  AgentFormsReceivedBloc({required this.repository})
      : super(AgentFormsReceivedInitialState()) {
    on<AgentFormsReceivedLoadingEvent>(_getReceivedForms);
    on<AgentFormsSendProposalEvent>(_sendProposal);
  }
  final AgentFormsReceivedRepository repository;

  void _getReceivedForms(AgentFormsReceivedLoadingEvent event, emit) async {
    try {
      emit(AgentFormsReceivedLoadingState());
      final Response response = await repository.getReceivedForms(
          userEmail: FirebaseAuth.instance.currentUser!.email!);

      final Map<String, dynamic> decodedData = json.decode(response.body);

      print(decodedData);

      final String responseMessage = decodedData['message'];
      final List<dynamic> receivedFormsJson = decodedData['data'];

      final List<ReceivedFormModel> receivedForms = [];

      for (final Map<String, dynamic> json in receivedFormsJson) {
        receivedForms.add(ReceivedFormModel.fromJson(json));
      }

      print(receivedForms);

      emit(AgentFormsReceivedSucessState(
          receivedForms: receivedForms, message: responseMessage));
    } catch (e) {
      emit(AgentFormsReceivedFailedState(error: e.toString()));
    }
  }

  void _sendProposal(AgentFormsSendProposalEvent event, emit) async {
    try {
      final Response response = await repository.sendProposal(
          userEmail: FirebaseAuth.instance.currentUser!.email!,
          proposal: event.proposal,
          senderAgentFormId: event.senderAgentFormId);

      final Map<String, dynamic> decodedData = json.decode(response.body);

      print(decodedData);

      final String responseMessage = decodedData['message'];

      emit(AgentFormsReceivedSucessState(
          receivedForms: (state as AgentFormsReceivedSucessState).receivedForms,
          message: responseMessage));
    } catch (e) {
      emit(AgentFormsReceivedFailedState(error: e.toString()));
    }
  }
}
