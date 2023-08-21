import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mrb/src/sender_agent_form/bloc/sender_agent_form_event.dart';
import 'package:mrb/src/sender_agent_form/bloc/sender_agent_form_state.dart';
import 'package:mrb/src/sender_agent_form/repository/sender_agent_form_repository.dart';

class SenderAgentFormBloc
    extends Bloc<SenderAgentFormEvent, SenderAgentFormState> {
  SenderAgentFormBloc({required this.repository})
      : super(SenderAgentFormInitialState(desiredDate: DateTime.now())) {
    on<SenderAgentFormChangeIsBuyerEvent>(_changeIsBuyer);
    on<SenderAgentFormChangeFormTypeEvent>(_changeFormType);
    on<SenderAgentFormChangeDesiredDateEvent>(_changeDesiredDate);
    on<SenderAgentFormSubmitEvent>(_submitForm);
  }

  final SenderAgentFormRepository repository;

  void _submitForm(SenderAgentFormSubmitEvent event, emit) async {
    try {
      emit(SenderAgentFormLoadingState(
          receiverAgentEmail: state.receiverAgentEmail,
          desiredDate: state.desiredDate,
          formType: state.formType,
          userType: state.userType));

      final Response response = await repository.createForm(
          city: event.city,
          senderAgent: FirebaseAuth.instance.currentUser!.email!,
          receiverAgent: event.receiverAgent,
          desiredDate: state.desiredDate,
          state: event.state,
          price: double.parse(event.price),
          formType: state.formType,
          userType: state.userType);

      final String responseMessage = json.decode(response.body)['message'];

      if (response.statusCode == 500) throw Exception(responseMessage);

      emit(SenderAgentFormSuccessState(
          message: responseMessage,
          receiverAgentEmail: state.receiverAgentEmail,
          desiredDate: state.desiredDate,
          formType: state.formType,
          userType: state.userType));
    } catch (e) {
      emit(SenderAgentFormFailedState(
          error: e.toString(),
          receiverAgentEmail: state.receiverAgentEmail,
          desiredDate: state.desiredDate,
          formType: state.formType,
          userType: state.userType));
    }
  }

  void _changeIsBuyer(SenderAgentFormChangeIsBuyerEvent event, emit) {
    emit(SenderAgentFormInitialState(
        desiredDate: state.desiredDate,
        userType: event.userType,
        receiverAgentEmail: state.receiverAgentEmail,
        formType: state.formType));
  }

  void _changeFormType(SenderAgentFormChangeFormTypeEvent event, emit) {
    emit(SenderAgentFormInitialState(
        desiredDate: state.desiredDate,
        userType: state.userType,
        receiverAgentEmail: state.receiverAgentEmail,
        formType: event.formType));
  }

  void _changeDesiredDate(SenderAgentFormChangeDesiredDateEvent event, emit) {
    emit(SenderAgentFormInitialState(
        desiredDate: event.desiredDate,
        userType: state.userType,
        receiverAgentEmail: state.receiverAgentEmail,
        formType: state.formType));
  }
}
