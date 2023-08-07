import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mrb/src/network_page/bloc/network_page_event.dart';
import 'package:mrb/src/network_page/bloc/network_page_state.dart';
import 'package:mrb/src/network_page/model/user_model.dart';
import 'package:mrb/src/network_page/repository/network_page_repository.dart';

class NetworkPageBloc extends Bloc<NetworkPageEvent, NetworkPageState> {
  NetworkPageBloc({required this.repository})
      : super(NetworkPageInitialState()) {
    on<NetworkPageGetAssociatesEvent>(_getAllAssociates);
  }

  final NetworkPageRepository repository;

  void _getAllAssociates(NetworkPageGetAssociatesEvent event, emit) async {
    try {
      final Response response = await repository.getAssociates();
      final responseJson = json.decode(response.body);
      final List<dynamic> responseJsonData = responseJson['data'];
      final List<UserModel> associates = responseJsonData
          .map(
            (user) => UserModel.toJSON(user),
          )
          .toList();
      emit(NetworkPageSuccessState(associates: associates));
    } catch (e) {
      print('Error $e');
    }
  }
}
