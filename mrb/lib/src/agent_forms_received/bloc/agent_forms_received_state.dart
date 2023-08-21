import 'package:equatable/equatable.dart';
import 'package:mrb/src/agent_forms_received/model/form_model.dart';

abstract class AgentFormsReceivedState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AgentFormsReceivedInitialState extends AgentFormsReceivedState {}

final class AgentFormsReceivedLoadingState extends AgentFormsReceivedState {}

final class AgentFormsReceivedSucessState extends AgentFormsReceivedState {
  AgentFormsReceivedSucessState(
      {required this.receivedForms, required this.message});
  final List<ReceivedFormModel> receivedForms;
  final String message;

  @override
  List<Object?> get props => [receivedForms, message];
}

final class AgentFormsReceivedFailedState extends AgentFormsReceivedState {
  AgentFormsReceivedFailedState({required this.error});
  final String error;

  @override
  List<Object?> get props => [error];
}
