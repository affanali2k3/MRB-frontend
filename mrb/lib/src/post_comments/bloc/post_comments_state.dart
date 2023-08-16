import 'package:equatable/equatable.dart';
import 'package:mrb/src/post_comments/model/comment_mode.dart';

class PostCommentsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostCommentsInitialState extends PostCommentsState {}

class PostCommentsLoadingState extends PostCommentsState {}

class PostCommentSuccessState extends PostCommentsState {
  PostCommentSuccessState({required this.comments, required this.message});
  final List<CommentModel> comments;
  final String message;

  @override
  List<Object?> get props => [comments, message];
}

class PostCommentFailedState extends PostCommentsState {
  PostCommentFailedState({required this.error});
  final String error;
}
