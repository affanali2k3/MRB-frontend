import 'package:equatable/equatable.dart';

class UserTimelineEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserTimelinePostLikeEvent extends UserTimelineEvent {
  UserTimelinePostLikeEvent({required this.index, required this.postId});
  final int index;
  final String postId;
}

class UserTimelineLoadingEvent extends UserTimelineEvent {
  UserTimelineLoadingEvent({required this.userEmail});
  final String userEmail;
}
