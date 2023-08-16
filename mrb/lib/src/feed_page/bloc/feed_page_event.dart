import 'package:equatable/equatable.dart';

class FeedPageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FeedPageLoadingEvent extends FeedPageEvent {
  FeedPageLoadingEvent({required this.userEmail});
  final String userEmail;
}
