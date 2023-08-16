import 'package:equatable/equatable.dart';

class FeedPageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FeedPageLoadingEvent extends FeedPageEvent {
  FeedPageLoadingEvent({required this.userEmail, required this.pageNumber});
  final String userEmail;
  final String pageNumber;
}
