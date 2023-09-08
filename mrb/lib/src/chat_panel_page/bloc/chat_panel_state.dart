import 'package:equatable/equatable.dart';
import 'package:mrb/src/chat_panel_page/model/chat_panel_model.dart';

abstract class ChatPanelState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ChatPanelInitialState extends ChatPanelState {}

final class ChatPanelLoadingState extends ChatPanelState {}

final class ChatPanelSuccessState extends ChatPanelState {
  ChatPanelSuccessState({required this.chats});
  final List<ChatModel> chats;

  @override
  List<Object?> get props => [chats];
}

final class ChatPanelFailedState extends ChatPanelState {
  ChatPanelFailedState({required this.error});
  final String error;

  @override
  List<Object?> get props => [error];
}
