import 'package:equatable/equatable.dart';
import 'package:mrb/src/network_page/model/user_model.dart';

abstract class SearchPageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchPageInitialState extends SearchPageState {}

class SearchPageSuccessState extends SearchPageState {
  SearchPageSuccessState({required this.queryResult});
  final List<UserModel>? queryResult;

  @override
  List<Object?> get props => [queryResult];
}
