import 'package:equatable/equatable.dart';
import 'package:mrb/src/user_timeline/model/post_model.dart';

class FeedPageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FeedPageInitialState extends FeedPageState {}

class FeedPageLoadingState extends FeedPageState {}

class FeedPageFailedState extends FeedPageState {
  FeedPageFailedState({required this.error});
  final String error;
}

class FeedPageSuccessState extends FeedPageState {
  FeedPageSuccessState({required this.posts});
  final List<PostModel> posts;

  @override
  List<Object?> get props => [posts];
}
