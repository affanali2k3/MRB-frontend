import 'package:equatable/equatable.dart';

abstract class ProfileNetworkPageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ProfileNetworkPageLoadingEvent extends ProfileNetworkPageEvent {
  ProfileNetworkPageLoadingEvent({required this.userId});
  final int userId;
}
