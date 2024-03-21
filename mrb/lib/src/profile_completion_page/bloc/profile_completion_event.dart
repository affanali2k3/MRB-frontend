part of 'profile_completion_bloc.dart';

@immutable
sealed class ProfileCompletionEvent {}

class ProfileCompletionSubmitEvent extends ProfileCompletionEvent {
  ProfileCompletionSubmitEvent(
      {required this.name,
      required this.phone,
      required this.referralCode,
      required this.licenseNumber,
      required this.licenseState,
      required this.licenseYear});

  final String name;
  final String phone;
  final String referralCode;
  final String licenseNumber;
  final String licenseState;
  final int licenseYear;
}

final class ProfileCompletionErrorEvent extends ProfileCompletionEvent {
  ProfileCompletionErrorEvent({required this.type, required this.message});
  final ProfileCompletionPageErrorTypes type;
  final String message;
}
