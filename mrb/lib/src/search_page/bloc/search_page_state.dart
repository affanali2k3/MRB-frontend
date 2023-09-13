import 'package:equatable/equatable.dart';
import 'package:mrb/src/network_page/model/user_model.dart';

abstract class SearchPageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchPageInitialState extends SearchPageState {}

class SearchPageAgentSearchState extends SearchPageState {
  SearchPageAgentSearchState({required this.agents});
  final List<UserModel> agents;

  @override
  List<Object?> get props => [agents];
}
