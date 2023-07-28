import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrb/profile_page/bloc/profile_page_event.dart';
import 'package:mrb/profile_page/bloc/profile_page_state.dart';
import 'package:mrb/profile_page/repository/profile_page_repository.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  ProfilePageBloc({required this.repository})
      : super(ProfilePageLoadingState()) {
    on<ProfilePageLoadingEvent>(_getProfileData);
  }

  final ProfilePageRepository repository;

  void _getProfileData(ProfilePageLoadingEvent event, emit) async {
    final response = await repository.getUserDetails();
    final responseJson = json.decode(response);
    final data = responseJson['data'];
    final photo = responseJson['photo'];
    emit(ProfilePageSuccessState(
        ssn: data['ssn'],
        email: data['email'],
        name: data['name'],
        licence: data['licence'],
        photo: photo,
        phone: data['phone'],
        occupation: data['occupation'],
        gender: data['gender']));
  }
}
