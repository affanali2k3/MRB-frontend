import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mrb/global_variables.dart';
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
      print(response.body);
      final Map<String, dynamic> responseJson = json.decode(response.body);

      final List<dynamic> commentsListDynamic = responseJson['data'];
      print(response.body);

      final List<CommentModel> comments = commentsListDynamic
          .map((comment) => CommentModel.fromJson(comment))
          .toList();
      print(response.body);

      emit(PostCommentSuccessState(
          comments: comments, message: 'Comments loaded scu'));
    } catch (err) {
      emit(PostCommentFailedState(error: err.toString()));
    }
  }

  void _saveComment(PostCommentsSaveCommentEvent event, emit) async {
    try {
      print('aaa');
      final Response response = await repository.saveComment(
          postId: event.postId, text: event.comment);
      print(response.body);

      final Map<String, dynamic> responseDataJson = json.decode(response.body);
      final int commentId = responseDataJson['data'];

      final successState = state as PostCommentSuccessState;
      final List<CommentModel> comments = List.from(successState.comments);
      print(response.body);

      comments.insert(
          0,
          CommentModel(
              id: commentId,
              postId: event.postId,
              userId: GlobalVariables.user.id,
              text: event.comment));

      emit(PostCommentSuccessState(
          comments: comments, message: 'Comment saved'));
    } catch (e) {
      print(e);
      emit(PostCommentFailedState(error: e.toString()));
    }
  }
}
