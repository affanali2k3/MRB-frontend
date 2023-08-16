import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mrb/src/post_comments/bloc/post_comments_event.dart';
import 'package:mrb/src/post_comments/bloc/post_comments_state.dart';
import 'package:mrb/src/post_comments/repository/post_comments_repository.dart';
import 'package:mrb/src/post_comments/model/comment_mode.dart';

class PostCommentsBloc extends Bloc<PostCommentsEvent, PostCommentsState> {
  PostCommentsBloc({required this.repository})
      : super(PostCommentsInitialState()) {
    on<PostCommentsLoadingEvent>(_loadPostComment);
    on<PostCommentsSaveCommentEvent>(_saveComment);
  }

  final PostCommentsRepository repository;

  void _loadPostComment(PostCommentsLoadingEvent event, emit) async {
    try {
      emit(PostCommentsLoadingState());
      final Response response =
          await repository.loadComments(postId: event.postId);
      final Map<String, dynamic> responseJson = json.decode(response.body);

      final List<dynamic> commentsListDynamic = responseJson['data'];

      final List<CommentModel> comments = commentsListDynamic
          .map((comment) => CommentModel.fromJson(comment))
          .toList();

      emit(PostCommentSuccessState(
          comments: comments, message: 'Comments loaded scu'));
    } catch (err) {
      emit(PostCommentFailedState(error: err.toString()));
    }
  }

  void _saveComment(PostCommentsSaveCommentEvent event, emit) async {
    try {
      final Response response = await repository.saveComment(
          postId: event.postId, text: event.comment);
      final Map<String, dynamic> responseDataJson = json.decode(response.body);
      final int commentId = responseDataJson['data'];

      final successState = state as PostCommentSuccessState;
      final List<CommentModel> comments = List.from(successState.comments);

      comments.insert(
          0,
          CommentModel(
              id: commentId,
              postId: int.parse(event.postId),
              userEmail: FirebaseAuth.instance.currentUser!.email!,
              text: event.comment));

      emit(PostCommentSuccessState(
          comments: comments, message: 'Comment saved'));
    } catch (e) {
      emit(PostCommentFailedState(error: e.toString()));
    }
  }
}
