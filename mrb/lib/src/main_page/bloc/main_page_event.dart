import 'package:equatable/equatable.dart';

abstract class MainPageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangePageEvent extends MainPageEvent {
  ChangePageEvent({required this.page});
  final String page;
}
