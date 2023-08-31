import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mrb/src/network_page/model/user_model.dart';
import 'package:mrb/src/search_page/bloc/search_page_event.dart';
import 'package:mrb/src/search_page/bloc/search_page_state.dart';
import 'package:mrb/src/search_page/repository/search_page_repository.dart';

class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {
  SearchPageBloc({required this.repository}) : super(SearchPageInitialState()) {
    on<SearchPageSearchEvent>(_search);
  }

  final SearchPageRepository repository;

  void _search(SearchPageSearchEvent event, emit) async {
    try {
      final Response response =
          await repository.search(searchQuery: event.searchQuery);

      final responseJson = json.decode(response.body);
      final List<dynamic> responseJsonData = responseJson['data'];
      final List<UserModel> result = responseJsonData
          .map(
            (user) => UserModel.fromJson(user),
          )
          .toList();
      emit(SearchPageSuccessState(queryResult: result));
    } catch (e) {
      print(e);
    }
  }
}
