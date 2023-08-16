import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mrb/src/feed_page/bloc/feed_page_event.dart';
import 'package:mrb/src/feed_page/bloc/feed_page_state.dart';
import 'package:mrb/src/feed_page/repository/feed_page_repository.dart';
import 'package:mrb/src/user_timeline/model/post_model.dart';

class FeedPageBloc extends Bloc<FeedPageEvent, FeedPageState> {
  FeedPageBloc({required this.repository}) : super(FeedPageInitialState()) {
    on<FeedPageLoadingEvent>(_loadPosts);
  }

  final FeedPageRepository repository;

  void _loadPosts(FeedPageLoadingEvent event, emit) async {
    try {
      if (event.pageNumber == '1') {
        emit(FeedPageLoadingState(posts: const []));
      } else {
        emit(
            FeedPageSuccessState(posts: (state as FeedPageSuccessState).posts));
      }
      final Response response = await repository.loadPosts(
          userEmail: event.userEmail, pageNumber: event.pageNumber);
      final Map<String, dynamic> responseJson = json.decode(response.body);
      // print(responseJson);
      final List<dynamic> responseJsonData = responseJson['data'];
      final List<PostModel> newPosts = responseJsonData
          .map(
            (post) => PostModel.fromJson(post),
          )
          .toList();

      if (state is FeedPageSuccessState) {
        final List<PostModel> posts =
            List.from((state as FeedPageSuccessState).posts);
        posts.addAll(newPosts);
        emit(FeedPageSuccessState(posts: posts));
      } else {
        emit(FeedPageSuccessState(posts: newPosts));
      }
      print('Emitted');
    } catch (e) {
      emit(FeedPageFailedState(error: e.toString()));
    }
  }
}
