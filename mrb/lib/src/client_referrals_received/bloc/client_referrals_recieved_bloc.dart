import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mrb/src/client_referrals_received/bloc/client_referrals_recieved_event.dart';
import 'package:mrb/src/client_referrals_received/bloc/client_referrals_recieved_state.dart';
import 'package:mrb/src/client_referrals_received/model/form_model.dart';
import 'package:mrb/src/client_referrals_received/repository/client_referrals_received_repository.dart';

class ClientReferralsRecievedBloc
    extends Bloc<ClientReferralsRecievedEvent, ClientReferralsRecievedState> {
  ClientReferralsRecievedBloc({required this.repository})
      : super(ClientReferralsRecievedInitialState()) {
    on<ClientReferralsRecievedLoadingEvent>(_getReceivedForms);
    on<ClientReferralsRecievedProposalEvent>(_sendProposal);
  }
  final ClientReferralsReceivedRepository repository;

  void _getReceivedForms(
      ClientReferralsRecievedLoadingEvent event, emit) async {
    try {
      emit(ClientReferralsRecievedLoadingState());
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

      emit(ClientReferralsRecievedSuccessState(
          receivedForms: receivedForms, message: responseMessage));
    } catch (e) {
      emit(ClientReferralsRecievedFailedState(error: e.toString()));
    }
  }

  void _sendProposal(ClientReferralsRecievedProposalEvent event, emit) async {
    try {
      final Response response = await repository.sendProposal(
          userEmail: FirebaseAuth.instance.currentUser!.email!,
          proposal: event.proposal,
          senderAgentFormId: event.senderAgentFormId);

      final Map<String, dynamic> decodedData = json.decode(response.body);

      print(decodedData);

      final String responseMessage = decodedData['message'];

      emit(ClientReferralsRecievedSuccessState(
          receivedForms:
              (state as ClientReferralsRecievedSuccessState).receivedForms,
          message: responseMessage));
    } catch (e) {
      emit(ClientReferralsRecievedFailedState(error: e.toString()));
    }
  }
}
