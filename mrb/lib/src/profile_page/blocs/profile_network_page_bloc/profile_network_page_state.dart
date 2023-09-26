import 'package:equatable/equatable.dart';
import 'package:mrb/src/network_page/model/user_model.dart';

abstract class ProfileNetworkPageState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ProfileNetworkPageInitialState extends ProfileNetworkPageState {}

final class ProfileNetworkPageLoadingState extends ProfileNetworkPageState {}

final class ProfileNetworkPageSuccessState extends ProfileNetworkPageState {
  ProfileNetworkPageSuccessState({required this.userNetwork});
  final List<UserModel> userNetwork;
}

final class ProfileNetworkPageFailedState extends ProfileNetworkPageState {
  ProfileNetworkPageFailedState({required this.error});

  final String error;
}
