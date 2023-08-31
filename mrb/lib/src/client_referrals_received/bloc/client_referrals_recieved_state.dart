import 'package:equatable/equatable.dart';
import 'package:mrb/src/client_referrals_received/model/form_model.dart';

abstract class ClientReferralsRecievedState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ClientReferralsRecievedInitialState
    extends ClientReferralsRecievedState {}

final class ClientReferralsRecievedLoadingState
    extends ClientReferralsRecievedState {}

final class ClientReferralsRecievedSuccessState
    extends ClientReferralsRecievedState {
  ClientReferralsRecievedSuccessState(
      {required this.receivedForms, required this.message});
  final List<ReceivedFormModel> receivedForms;
  final String message;

  @override
  List<Object?> get props => [receivedForms, message];
}

final class ClientReferralsRecievedFailedState
    extends ClientReferralsRecievedState {
  ClientReferralsRecievedFailedState({required this.error});
  final String error;

  @override
  List<Object?> get props => [error];
}
