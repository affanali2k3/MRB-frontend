import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mrb/src/user_timeline/bloc/user_timeline_event.dart';
import 'package:mrb/src/user_timeline/bloc/user_timeline_state.dart';
import 'package:mrb/src/user_timeline/model/post_model.dart';
import 'package:mrb/src/user_timeline/repository/user_timeline_repository.dart';

class UserTimelineBloc extends Bloc<UserTimelineEvent, UserTimelineState> {
  UserTimelineBloc({required this.repository})
      : super(UserTimelineInitialState()) {
    on<UserTimelineLoadingEvent>(_loadTimeline);
    on<UserTimelinePostLikeEvent>(_likePost);
  }

  final UserTimelineRepository repository;

  void _likePost(UserTimelinePostLikeEvent event, emit) async {
    try {
      final successState = (state as UserTimelineSuccessState);
      List<PostModel> newPosts = List.from(successState.posts);

      final PostModel newPost =
          newPosts[event.index].copyWith(newPosts[event.index]);

      if (!newPost.isLiked) {
        await repository.likePost(
            email: FirebaseAuth.instance.currentUser!.email!,
            postId: event.postId);
        newPost.likes = newPost.likes + 1;
      } else {
        if (newPost.likeId != null) {
          await repository.removeLike(
              postId: newPost.postId, likeId: newPost.likeId!);
        }
        newPost.likes = newPost.likes - 1;
      }

      newPost.isLiked = !newPost.isLiked;
      newPosts[event.index] = newPost;
      emit(UserTimelineSuccessState(message: 'Success', posts: newPosts));
    } catch (e) {
      print(e);
    }
  }

  void _loadTimeline(UserTimelineLoadingEvent event, emit) async {
    try {
      emit(UserTimelineLoadingState());
      final Response response =
          await repository.loadTimeline(email: event.userEmail);
      final responseJson = json.decode(response.body);
      final List<dynamic> responseJsonData = responseJson['data'];
      print(responseJsonData);
      final List<PostModel> posts = responseJsonData
          .map(
            (post) => PostModel.fromJson(post),
          )
          .toList();
      print(posts);
      emit(UserTimelineSuccessState(message: 'Success', posts: posts));
    } catch (e) {
      emit(UserTimelineFailureState(error: e.toString()));
    }
  }
}
