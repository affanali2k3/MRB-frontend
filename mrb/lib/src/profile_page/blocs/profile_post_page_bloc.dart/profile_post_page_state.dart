import 'package:equatable/equatable.dart';
import 'package:mrb/src/profile_page/model/user_post_model.dart';

abstract class ProfilePostPageState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ProfilePostPageInitialState extends ProfilePostPageState {}

final class ProfilePostPageLoadingState extends ProfilePostPageState {}

final class ProfilePostPageSuccessState extends ProfilePostPageState {
  ProfilePostPageSuccessState({required this.posts});
  final List<UserPostModel> posts;
}

final class ProfilePostPageFailedState extends ProfilePostPageState {
  ProfilePostPageFailedState({required this.error});
  final String error;
}
