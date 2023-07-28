import 'package:equatable/equatable.dart';

abstract class ProfilePageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfilePageLoadingEvent extends ProfilePageEvent {}

class ProfilePageSuccessEvent extends ProfilePageEvent {}
