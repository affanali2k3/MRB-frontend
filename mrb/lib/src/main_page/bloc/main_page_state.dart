import 'package:equatable/equatable.dart';

abstract class MainPageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MainPageInitialState extends MainPageState {}

class ReferralCenterPageState extends MainPageState {}

class NetworkPageState extends MainPageState {}

class FeedPageState extends MainPageState {}

class NotificationPageState extends MainPageState {}

class ProfilePageState extends MainPageState {}
