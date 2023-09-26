import 'package:equatable/equatable.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_state.dart';

abstract class ProfilePageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfilePageLoadingEvent extends ProfilePageEvent {
  ProfilePageLoadingEvent({required this.userId, required this.associateId});
  final int userId;
  final int associateId;
}

final class ProfilePageChangeTabEvent extends ProfilePageEvent {
  ProfilePageChangeTabEvent({required this.profilePageTab});
  final ProfilePageTabs profilePageTab;
}

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
