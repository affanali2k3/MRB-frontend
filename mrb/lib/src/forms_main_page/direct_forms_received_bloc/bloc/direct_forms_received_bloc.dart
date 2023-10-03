import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/forms_main_page/direct_forms_received_bloc/bloc/direct_forms_received_event.dart';
import 'package:mrb/src/forms_main_page/direct_forms_received_bloc/bloc/direct_forms_received_state.dart';
import 'package:mrb/src/forms_main_page/direct_forms_received_bloc/model/direct_forms_model.dart';
import 'package:mrb/src/forms_main_page/direct_forms_received_bloc/repository/direct_forms_repository.dart';

class DirectFormsReceivedBloc
    extends Bloc<DirectFormsReceivedEvent, DirectFormsReceivedState> {
  DirectFormsReceivedBloc({required this.repository})
      : super(DirectFormsReceivedInitialState()) {
    on<DirectFormsReceivedLoadingEvent>(_loadDirectForms);
  }

  final DirectFormsRepository repository;

  void _loadDirectForms(DirectFormsReceivedLoadingEvent event, emit) async {
    try {
      emit(DirectFormsReceivedLoadingState());

      final Response response =
          await repository.loadForms(userId: GlobalVariables.user.id);

      print(response.body);

      final List<dynamic> directFormsJson = json.decode(response.body)['data'];
      final List<DirectFormModel> directForms = [];

      for (Map<String, dynamic> json in directFormsJson) {
        directForms.add(DirectFormModel.fromJson(json));
      }

      print(response.body);

      emit(DirectFormsReceivedSuccessState(directForms: directForms));
    } catch (e) {
      print(e);
      emit(DirectFormsReceivedFailedState(error: e.toString()));
    }
  }
}
