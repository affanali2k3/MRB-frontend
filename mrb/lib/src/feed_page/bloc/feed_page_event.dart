import 'package:equatable/equatable.dart';

class FeedPageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FeedPageLoadingEvent extends FeedPageEvent {
  FeedPageLoadingEvent({required this.userId, required this.pageNumber});
  final int userId;
  final int pageNumber;
}

class FeedPageLikePostEvent extends FeedPageEvent {
  FeedPageLikePostEvent({required this.userId, required this.postId});
  final int userId;
  final int postId;
}
