import 'package:equatable/equatable.dart';

abstract class ChatPanelEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ChatPanelLoadingEvent extends ChatPanelEvent {}

final class ChatPanelCreateChatEvent extends ChatPanelEvent {
  ChatPanelCreateChatEvent(
      {required this.receiverId,
      required this.senderId,
      required this.message});
  final int senderId;
  final int receiverId;
  final String message;
}
