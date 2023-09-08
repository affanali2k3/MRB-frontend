import 'package:equatable/equatable.dart';

abstract class ChatPanelEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ChatPanelLoadingEvent extends ChatPanelEvent {}
