import 'package:equatable/equatable.dart';
import 'package:mrb/src/network_page/model/user_model.dart';
import 'package:mrb/src/profile_page/model/user_analytics_model.dart';
import 'package:mrb/src/profile_page/model/user_association_model.dart';

enum ProfilePageTabs {
  profileNetworkTab,
  profilePostsTab,
  profileReviewsTab,
  profileAboutTab
}

abstract class ProfilePageState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ProfilePageInitialState extends ProfilePageState {}

class ProfilePageLoadingState extends ProfilePageState {}

class ProfilePageFailedState extends ProfilePageState {
  ProfilePageFailedState({required this.error});
  final String error;
}

class ProfilePageSuccessState extends ProfilePageState {
  ProfilePageSuccessState({
    required this.associationStatus,
    required this.analytics,
    required this.user,
    required this.tab,
  });
  final UserAssociationModel? associationStatus;
  final UserAnalyticsModel analytics;
  final UserModel user;
  final ProfilePageTabs tab;
  @override
  List<Object?> get props => [associationStatus, tab, user, analytics];
}
