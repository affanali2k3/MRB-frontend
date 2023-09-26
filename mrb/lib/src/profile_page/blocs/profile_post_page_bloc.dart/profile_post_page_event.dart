import 'package:equatable/equatable.dart';

abstract class ProfilePostPageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ProfilePostPageLoadingEvent extends ProfilePostPageEvent {
  ProfilePostPageLoadingEvent({required this.userId});
  final int userId;
}
