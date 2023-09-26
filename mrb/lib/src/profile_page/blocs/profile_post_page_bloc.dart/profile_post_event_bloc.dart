import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mrb/src/profile_page/blocs/profile_post_page_bloc.dart/profile_post_page_event.dart';
import 'package:mrb/src/profile_page/blocs/profile_post_page_bloc.dart/profile_post_page_state.dart';
import 'package:mrb/src/profile_page/model/user_post_model.dart';
import 'package:mrb/src/profile_page/repository/profile_page_repository.dart';

class ProfilePostPageBloc
    extends Bloc<ProfilePostPageEvent, ProfilePostPageState> {
  ProfilePostPageBloc({required this.repository})
      : super(ProfilePostPageInitialState()) {
    on<ProfilePostPageLoadingEvent>(_loadPosts);
  }

  final ProfilePageRepository repository;

  void _loadPosts(ProfilePostPageLoadingEvent event, emit) async {
    try {
      emit(ProfilePostPageLoadingState());
      final Response response =
          await repository.getAllPostsForUser(userId: event.userId);

      print(response.body);

      final List<dynamic> postsJson = json.decode(response.body)['data'];
      final List<UserPostModel> posts = [];

      for (final json in postsJson) {
        posts.add(UserPostModel.fromJson(json));
      }

      emit(ProfilePostPageSuccessState(
        posts: posts,
      ));
    } catch (e) {
      emit(ProfilePostPageFailedState(
        error: e.toString(),
      ));
    }
  }
}
