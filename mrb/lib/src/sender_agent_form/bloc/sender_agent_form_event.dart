import 'package:equatable/equatable.dart';
import 'package:mrb/src/sender_agent_form/bloc/sender_agent_form_state.dart';

abstract class SenderAgentFormEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SenderAgentFormChangeIsBuyerEvent extends SenderAgentFormEvent {
  SenderAgentFormChangeIsBuyerEvent({required this.userType});
  final UserType userType;
}

final class SenderAgentFormChangeDesiredDateEvent extends SenderAgentFormEvent {
  SenderAgentFormChangeDesiredDateEvent({required this.desiredDate});
  final DateTime desiredDate;
}

final class SenderAgentFormChangeFormTypeEvent extends SenderAgentFormEvent {
  SenderAgentFormChangeFormTypeEvent({required this.formType});

  final FormType formType;
}

final class SenderAgentFormSubmitEvent extends SenderAgentFormEvent {
  SenderAgentFormSubmitEvent(
      {required this.city,
      required this.price,
      required this.state,
      this.receiverAgent});
  final String city;
  final String state;
  final String price;
  final String? receiverAgent;
}
