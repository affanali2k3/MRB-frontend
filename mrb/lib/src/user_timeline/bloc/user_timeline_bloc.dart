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
  }

  final UserTimelineRepository repository;

  void _loadTimeline(UserTimelineLoadingEvent event, emit) async {
    try {
      emit(UserTimelineLoadingState());
      final Response response = await repository.loadTimeline(
          email: FirebaseAuth.instance.currentUser!.email!);
      final responseJson = json.decode(response.body);
      final List<dynamic> responseJsonData = responseJson['data'];
      final List<PostModel> posts = responseJsonData
          .map(
            (post) => PostModel.fromJson(post),
          )
          .toList();
      print(posts);
      emit(UserTimelineSuccessState(message: 'Success'));
    } catch (e) {
      emit(UserTimelineFailureState(error: e.toString()));
    }
  }
}
