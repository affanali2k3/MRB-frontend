import 'package:equatable/equatable.dart';

abstract class ProfilePageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfilePageLoadingEvent extends ProfilePageEvent {
  ProfilePageLoadingEvent(
      {required this.userEmail, required this.associateEmail});
  final String userEmail;
  final String associateEmail;
}

class ProfilePagePostTabEvent extends ProfilePageEvent {}

class ProfilePageReviewsTabEvent extends ProfilePageEvent {}

class ProfilePageNetworkTabEvent extends ProfilePageEvent {}

class ProfilePageAboutTabEvent extends ProfilePageEvent {}

class ProfilePageSendAssociateRequestEvent extends ProfilePageEvent {
  ProfilePageSendAssociateRequestEvent(
      {required this.senderEmail, required this.receiverEmail});
  final String senderEmail;
  final String receiverEmail;
}

class ProfilePageAcceptAssociateRequestEvent extends ProfilePageEvent {
  ProfilePageAcceptAssociateRequestEvent(
      {required this.senderEmail, required this.receiverEmail});
  final String senderEmail;
  final String receiverEmail;
}
