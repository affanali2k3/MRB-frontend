import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mrb/src/agent_forms_received/model/form_model.dart';
import 'package:mrb/src/sent_client_referrals/bloc/sent_client_referrals_event.dart';
import 'package:mrb/src/sent_client_referrals/bloc/sent_client_referrals_state.dart';
import 'package:mrb/src/sent_client_referrals/repository/sent_client_referrals_repository.dart';

class SentClientReferralsBloc
    extends Bloc<SentClientReferralsEvent, SentClientReferralsState> {
  SentClientReferralsBloc({required this.repository})
      : super(SentClientReferralsInitialState()) {
    on<SentClientReferralsOpenLoadingEvent>(_loadClientReferralsSentOpenly);
    on<SentClientReferralsDirectLoadingEvent>(_loadClientReferralsSentDirectly);
  }

  final SentClientReferralsRepository repository;

  void _loadClientReferralsSentOpenly(
      SentClientReferralsOpenLoadingEvent event, emit) async {
    try {
      final Response response = await repository.getClientReferralsSentOpenly(
          userEmail: FirebaseAuth.instance.currentUser!.email!);
      final List<dynamic> openClientReferralsSentJson =
          json.decode(response.body)['data'];
      final List<FormReceivedModel> openClientReferralsSent = [];

      for (final json in openClientReferralsSentJson) {
        openClientReferralsSent.add(FormReceivedModel.fromJson(json));
      }

      emit(SentClientReferralsOpenSuccessState(
          openReferralsSent: openClientReferralsSent));
    } catch (e) {
      emit(SentClientReferralsOpenFailedState(error: e.toString()));
    }
  }

  void _loadClientReferralsSentDirectly(
      SentClientReferralsDirectLoadingEvent event, emit) async {
    try {
      final Response response = await repository.getClientReferralsSentDirectly(
          userEmail: FirebaseAuth.instance.currentUser!.email!);
      final List<dynamic> directClientReferralsSentJson =
          json.decode(response.body)['data'];
      final List<FormReceivedModel> directClientReferralsSent = [];

      for (final json in directClientReferralsSentJson) {
        directClientReferralsSent.add(FormReceivedModel.fromJson(json));
      }

      emit(SentClientReferralsDirectSuccessState(
          directReferralsSent: directClientReferralsSent));
    } catch (e) {
      emit(SentClientReferralsDirectFailedState(error: e.toString()));
    }
  }
}
