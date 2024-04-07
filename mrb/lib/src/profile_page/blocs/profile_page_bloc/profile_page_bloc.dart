import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mrb/src/network_page/model/user_model.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_event.dart';
import 'package:mrb/src/profile_page/blocs/profile_page_bloc/profile_page_state.dart';
import 'package:mrb/src/profile_page/model/user_analytics_model.dart';
import 'package:mrb/src/profile_page/model/user_association_model.dart';
import 'package:mrb/src/profile_page/repository/profile_page_repository.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  ProfilePageBloc({required this.repository})
      : super(ProfilePageInitialState()) {
    on<ProfilePageLoadingEvent>(_getProfileData);
    on<ProfilePageChangeTabEvent>(_changeTab);
    on<ProfilePageSendAssociateRequestEvent>(_sendAssociateRequest);
    on<ProfilePageAcceptAssociateRequestEvent>(_acceptAssociationRequest);
  }

  final ProfilePageRepository repository;

  void _changeTab(ProfilePageChangeTabEvent event, emit) {
    final ProfilePageSuccessState successState =
        state as ProfilePageSuccessState;
    emit(ProfilePageSuccessState(
      analytics: successState.analytics,
      associationStatus: successState.associationStatus,
      user: successState.user,
      tab: event.profilePageTab,
    ));
  }

  void _getProfileData(ProfilePageLoadingEvent event, emit) async {
    try {
      emit(ProfilePageLoadingState());
      final Response user =
          await repository.getUserDetails(userId: event.userId);

      final Response status = await repository.getAssociationStatus(
          userId: event.userId, associateId: event.associateId);

      final Response analytics =
          await repository.getUserAnalytics(userId: event.userId);

      final associationStausJson = json.decode(status.body)['data'];
      final userData = UserModel.fromJson(json.decode(user.body)['data']);
      final analyticsData =
          UserAnalyticsModel.fromJson(json.decode(analytics.body)['data']);

      final UserAssociationModel? associationStatus;

      if (associationStausJson == null) {
        associationStatus = null;
      } else {
        associationStatus = UserAssociationModel.fromJson(associationStausJson);
      }

      // print(response.body);

      emit(ProfilePageSuccessState(
        associationStatus: associationStatus,
        user: userData,
        analytics: analyticsData,
        tab: ProfilePageTabs.profilePostsTab,
      ));
    } catch (e) {
      emit(ProfilePageFailedState(error: e.toString()));
    }
  }

  void _sendAssociateRequest(
      ProfilePageSendAssociateRequestEvent event, emit) async {
    try {
      final Response response = await repository.sendAssociateEvent(
          senderId: event.senderId, receiverId: event.receiverId);

      final successState = (state as ProfilePageSuccessState);
      if (response.statusCode == 500) {
      } else if (response.statusCode == 200) {
        emit(ProfilePageSuccessState(
          associationStatus: UserAssociationModel(
              senderId: event.senderId,
              receiverId: event.receiverId,
              status: 'Pending'),
          analytics: successState.analytics,
          user: successState.user,
          tab: successState.tab,
        ));
      }
    } catch (e) {
      print(e);
    }
  }

  void _acceptAssociationRequest(
      ProfilePageAcceptAssociateRequestEvent event, emit) async {
    try {
      await repository.acceptAssociation(
          senderId: event.senderId, receiverId: event.receiverId);
    } catch (e) {
      print(e);
    }
  }
}
