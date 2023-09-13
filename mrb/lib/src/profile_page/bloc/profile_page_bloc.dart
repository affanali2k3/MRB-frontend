import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_event.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_state.dart';
import 'package:mrb/src/profile_page/model/user_association_model.dart';
import 'package:mrb/src/profile_page/model/user_network_model.dart';
import 'package:mrb/src/profile_page/model/user_post_model.dart';
import 'package:mrb/src/profile_page/repository/profile_page_repository.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  ProfilePageBloc({required this.repository})
      : super(ProfilePageLoadingState()) {
    on<ProfilePageLoadingEvent>(_getProfileData);
    on<ProfilePageSendAssociateRequestEvent>(_sendAssociateRequest);
    on<ProfilePageAcceptAssociateRequestEvent>(_acceptAssociationRequest);
    on<ProfilePagePostTabEvent>(_gotoPostTab);
    on<ProfilePageReviewsTabEvent>(_gotoReviewTab);
    on<ProfilePageNetworkTabEvent>(_gotoNetworkTab);
    on<ProfilePageAboutTabEvent>(_gotoAboutTab);
  }

  final ProfilePageRepository repository;

  void _gotoPostTab(ProfilePagePostTabEvent event, emit) async {
    final Response response =
        await repository.getAllPostsForUser(userId: event.userId);

    print(response.body);

    final List<dynamic> postsJson = json.decode(response.body)['data'];
    final List<UserPostModel> posts = [];

    for (final json in postsJson) {
      posts.add(UserPostModel.fromJson(json));
    }

    emit(ProfilePagePostTabState(posts: posts));
  }

  void _gotoNetworkTab(ProfilePageNetworkTabEvent event, emit) async {
    final Response response =
        await repository.getAllAssociatesForUser(userId: event.userId);

    final List<dynamic> userNetworkJson = json.decode(response.body)['data'];
    final List<UserNetworkModel> userNetwork = [];

    for (final json in userNetworkJson) {
      userNetwork.add(UserNetworkModel.fromJson(json));
    }

    emit(ProfilePageNetworkTabState(userNetwork: userNetwork));
  }

  void _gotoAboutTab(ProfilePageAboutTabEvent event, emit) =>
      emit(ProfilePageAboutTabState());

  void _gotoReviewTab(ProfilePageReviewsTabEvent event, emit) =>
      emit(ProfilePageReviewsTabState());

  void _getProfileData(ProfilePageLoadingEvent event, emit) async {
    try {
      final String response =
          await repository.getUserDetails(userId: event.userId);

      final Response status = await repository.getAssociationStatus(
          userId: event.userId, associateId: event.associateId);

      final associationStausJson = json.decode(status.body)['data'];
      final UserAssociationModel? associationStatus;

      if (associationStausJson == null) {
        associationStatus = null;
      } else {
        associationStatus = UserAssociationModel.fromJson(associationStausJson);
      }

      final responseJson = json.decode(response);

      final data = responseJson['data'];

      final photo = responseJson['photo'];

      emit(ProfilePageSuccessState(
          associationStatus: associationStatus,
          address: data['address'],
          licenceState: data['licenceState'],
          licenceNumber: data['licenceNumber'],
          yearLicenced: data['yearLicenced'],
          completedDeals: data['completedDeals'],
          email: data['email'],
          name: data['name'],
          licence: data['licence'],
          photo: photo,
          phone: data['phone'],
          occupation: data['occupation'],
          gender: data['gender']));
    } catch (e) {
      print(e);
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
            email: successState.email,
            name: successState.name,
            licence: successState.licence,
            photo: successState.photo,
            phone: successState.phone,
            address: successState.address,
            completedDeals: successState.completedDeals,
            licenceState: successState.licenceState,
            licenceNumber: successState.licenceNumber,
            yearLicenced: successState.yearLicenced,
            occupation: successState.occupation,
            gender: successState.gender));
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
