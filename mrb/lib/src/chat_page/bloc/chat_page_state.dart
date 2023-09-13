import 'package:equatable/equatable.dart';
import 'package:mrb/src/chat_page/model/chat_model.dart';

abstract class ChatPageState extends Equatable {
  const ChatPageState({required this.messages});
  final List<MessageModel> messages;

  @override
  List<Object?> get props => [messages];
}

class ChatPageInitialState extends ChatPageState {
  const ChatPageInitialState({required super.messages});
}

class ChatPageMessagesLoadedState extends ChatPageState {
  const ChatPageMessagesLoadedState({required super.messages});

  @override
  List<Object?> get props => [messages];
}
