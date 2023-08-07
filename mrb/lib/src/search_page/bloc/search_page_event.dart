import 'package:equatable/equatable.dart';

abstract class SearchPageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchPageSearchEvent extends SearchPageEvent {
  SearchPageSearchEvent({required this.searchQuery});
  final String searchQuery;
}
