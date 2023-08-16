import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_event.dart';
import 'package:mrb/src/profile_page/bloc/profile_page_state.dart';
import 'package:mrb/src/profile_page/model/user_association_model.dart';
import 'package:mrb/src/profile_page/repository/profile_page_repository.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  ProfilePageBloc({required this.repository})
      : super(ProfilePageLoadingState()) {
    on<ProfilePageLoadingEvent>(_getProfileData);
    on<ProfilePageSendAssociateRequestEvent>(_sendAssociateRequest);
    on<ProfilePageAcceptAssociateRequestEvent>(_acceptAssociationRequest);
  }

  final ProfilePageRepository repository;

  void _getProfileData(ProfilePageLoadingEvent event, emit) async {
    try {
      print('0');
      final String response =
          await repository.getUserDetails(email: event.userEmail);
      print('1');
      final Response status = await repository.getAssociationStatus(
          userName: event.userEmail, associateEmail: event.associateEmail);
      print('2');
      final associationStausJson = json.decode(status.body)['data'];
      final UserAssociationModel? associationStatus;

      if (associationStausJson == null) {
        associationStatus = null;
      } else {
        associationStatus = UserAssociationModel.fromJson(associationStausJson);
      }
      final responseJson = json.decode(response);
      final data = responseJson['data'];
      print(data);
      final photo = responseJson['photo'];

      print(associationStatus);
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
      print('a');
      final Response response = await repository.sendAssociateEvent(
          senderEmail: event.senderEmail, receiverEmail: event.receiverEmail);

      final successState = (state as ProfilePageSuccessState);
      if (response.statusCode == 500) {
      } else if (response.statusCode == 200) {
        emit(ProfilePageSuccessState(
            associationStatus: UserAssociationModel(
                senderEmail: event.senderEmail,
                receiverEmail: event.receiverEmail,
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

      print('b');
    } catch (e) {
      print(e);
    }
  }

  void _acceptAssociationRequest(
      ProfilePageAcceptAssociateRequestEvent event, emit) async {
    try {
      await repository.acceptAssociation(
          senderEmail: event.senderEmail, receiverEmail: event.receiverEmail);
    } catch (e) {
      print(e);
    }
  }
}
