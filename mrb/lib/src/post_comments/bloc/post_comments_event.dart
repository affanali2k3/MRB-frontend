import 'package:equatable/equatable.dart';

class PostCommentsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostCommentsSaveCommentEvent extends PostCommentsEvent {
  PostCommentsSaveCommentEvent({required this.comment, required this.postId});
  final int postId;
  final String comment;
}

class PostCommentsLoadingEvent extends PostCommentsEvent {
  PostCommentsLoadingEvent({required this.postId});
  final int postId;
}
