import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mrb/src/network_page/model/user_model.dart';
import 'package:mrb/src/profile_page/blocs/profile_network_page_bloc/profile_network_page_event.dart';
import 'package:mrb/src/profile_page/blocs/profile_network_page_bloc/profile_network_page_state.dart';
import 'package:mrb/src/profile_page/repository/profile_page_repository.dart';

class ProfileNetworkPageBloc
    extends Bloc<ProfileNetworkPageEvent, ProfileNetworkPageState> {
  ProfileNetworkPageBloc({required this.repository})
      : super(ProfileNetworkPageInitialState()) {
    on<ProfileNetworkPageLoadingEvent>(_loadNetwork);
  }

  final ProfilePageRepository repository;

  void _loadNetwork(ProfileNetworkPageLoadingEvent event, emit) async {
    try {
      emit(ProfileNetworkPageLoadingState());
      final Response response =
          await repository.getAllAssociatesForUser(userId: event.userId);

      final List<dynamic> userNetworkJson = json.decode(response.body)['data'];
      final List<UserModel> userNetwork = [];

      for (final json in userNetworkJson) {
        userNetwork.add(UserModel.fromJson(json));
      }

      emit(ProfileNetworkPageSuccessState(userNetwork: userNetwork));
    } catch (e) {
      emit(ProfileNetworkPageFailedState(error: e.toString()));
    }
  }
}
