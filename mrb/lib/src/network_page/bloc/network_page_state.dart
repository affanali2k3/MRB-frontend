import 'package:equatable/equatable.dart';
import 'package:mrb/src/network_page/model/user_model.dart';

abstract class NetworkPageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NetworkPageInitialState extends NetworkPageState {}

class NetworkPageSuccessState extends NetworkPageState {
  NetworkPageSuccessState({required this.associates});
  final List<UserModel> associates;

  @override
  List<Object?> get props => [associates];
}
