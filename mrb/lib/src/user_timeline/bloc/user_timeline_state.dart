import 'package:equatable/equatable.dart';
import 'package:mrb/src/user_timeline/model/post_model.dart';

class UserTimelineState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserTimelineLoadingState extends UserTimelineState {}

class UserTimelineSuccessState extends UserTimelineInitialState {
  UserTimelineSuccessState({required this.message, required this.posts});
  final String message;
  final List<PostModel> posts;

  @override
  List<Object?> get props => [message, posts];
}

class UserTimelineFailureState extends UserTimelineInitialState {
  UserTimelineFailureState({required this.error});
  final String error;

  @override
  List<Object?> get props => [error];
}

class UserTimelineInitialState extends UserTimelineState {}
