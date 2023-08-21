import 'package:equatable/equatable.dart';

enum UserType { buyer, seller }

enum FormType { direct, open }

abstract class SenderAgentFormState extends Equatable {
  const SenderAgentFormState(
      {required this.userType,
      required this.receiverAgentEmail,
      required this.desiredDate,
      required this.formType});

  final UserType userType;
  final String? receiverAgentEmail;
  final FormType formType;
  final DateTime desiredDate;
}

final class SenderAgentFormLoadingState extends SenderAgentFormState {
  const SenderAgentFormLoadingState(
      {required super.desiredDate,
      required super.userType,
      required super.receiverAgentEmail,
      required super.formType});
  @override
  List<Object?> get props =>
      [userType, receiverAgentEmail, formType, desiredDate];
}

final class SenderAgentFormInitialState extends SenderAgentFormState {
  const SenderAgentFormInitialState(
      {required super.desiredDate,
      super.userType = UserType.buyer,
      super.receiverAgentEmail,
      super.formType = FormType.direct});

  @override
  List<Object?> get props =>
      [userType, receiverAgentEmail, formType, desiredDate];
}

final class SenderAgentFormSuccessState extends SenderAgentFormState {
  const SenderAgentFormSuccessState(
      {required this.message,
      required super.userType,
      required super.desiredDate,
      required super.receiverAgentEmail,
      required super.formType});

  final String message;
  @override
  List<Object?> get props => [
        userType,
        receiverAgentEmail,
        formType,
        message,
        desiredDate,
      ];
}

final class SenderAgentFormFailedState extends SenderAgentFormState {
  const SenderAgentFormFailedState(
      {required this.error,
      required super.desiredDate,
      required super.userType,
      required super.receiverAgentEmail,
      required super.formType});

  final String error;

  @override
  List<Object?> get props => [
        userType,
        receiverAgentEmail,
        formType,
        error,
        desiredDate,
      ];
}
