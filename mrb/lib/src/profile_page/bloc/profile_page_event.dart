import 'package:equatable/equatable.dart';

abstract class ProfilePageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfilePageLoadingEvent extends ProfilePageEvent {
  ProfilePageLoadingEvent({required this.userId, required this.associateId});
  final int userId;
  final int associateId;
}

class ProfilePagePostTabEvent extends ProfilePageEvent {
  ProfilePagePostTabEvent({required this.userId});
  final int userId;
}

class ProfilePageReviewsTabEvent extends ProfilePageEvent {}

class ProfilePageNetworkTabEvent extends ProfilePageEvent {
  ProfilePageNetworkTabEvent({required this.userId});
  final int userId;
}

class ProfilePageAboutTabEvent extends ProfilePageEvent {}

class ProfilePageSendAssociateRequestEvent extends ProfilePageEvent {
  ProfilePageSendAssociateRequestEvent(
      {required this.senderId, required this.receiverId});
  final int senderId;
  final int receiverId;
}

class ProfilePageAcceptAssociateRequestEvent extends ProfilePageEvent {
  ProfilePageAcceptAssociateRequestEvent(
      {required this.senderId, required this.receiverId});
  final int senderId;
  final int receiverId;
}
