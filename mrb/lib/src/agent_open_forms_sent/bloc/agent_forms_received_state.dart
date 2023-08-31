import 'package:equatable/equatable.dart';
import 'package:mrb/src/client_referrals_received/model/form_model.dart';

abstract class AgentOpenFormsSentState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AgentOpenFormsSentInitialState extends AgentOpenFormsSentState {}

final class AgentOpenFormsSentLoadingState extends AgentOpenFormsSentState {}

final class AgentOpenFormsSentSuccessState extends AgentOpenFormsSentState {
  AgentOpenFormsSentSuccessState(
      {required this.sentForms, required this.message});
  final List<ReceivedFormModel> sentForms;
  final String message;

  @override
  List<Object?> get props => [sentForms, message];
}

final class AgentOpenFormsSentFailedState extends AgentOpenFormsSentState {
  AgentOpenFormsSentFailedState({required this.error});
  final String error;

  @override
  List<Object?> get props => [error];
}
