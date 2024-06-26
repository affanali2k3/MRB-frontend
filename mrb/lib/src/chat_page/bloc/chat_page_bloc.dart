import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/chat_page/bloc/chat_page_event.dart';
import 'package:mrb/src/chat_page/bloc/chat_page_state.dart';
import 'package:mrb/src/chat_page/model/chat_model.dart';
import 'package:mrb/src/chat_page/repository/chat_page_repository.dart';

class ChatPageBloc extends Bloc<ChatPageEvent, ChatPageState> {
  ChatPageBloc({required this.repository})
      : super(const ChatPageInitialState(messages: [])) {
    on<ChatPageLoadMessagesEvent>(_getChats);
    on<ChatPageSendMessageEvent>(_sendMessage);
  }

  final ChatPageRepository repository;

  void _getChats(ChatPageLoadMessagesEvent event, emit) async {
    try {
      final Response response = await repository.getAllChat(
          userOneId: event.userOneId, userTwoId: event.userTwoId);

      final responseJson = json.decode(response.body);
      final List<dynamic> responseJsonData = responseJson['data'];
      final List<MessageModel> messages = responseJsonData
          .map(
            (chat) => MessageModel.fromJson(chat),
          )
          .toList();

      print(messages);

      emit(ChatPageMessagesLoadedState(messages: messages));
    } catch (e) {
      print(e);
    }
  }

  void _sendMessage(ChatPageSendMessageEvent event, emit) async {
    try {
      GlobalVariables.socket.emit('message', {
        "msg": 'Hello',
        "senderEmail": FirebaseAuth.instance.currentUser?.email,
        "receiverEmail": "singh@rempower.com"
      });
      final Response response = await repository.saveMessage(
          receiverId: event.receiverId,
          senderId: event.senderId,
          message: event.message);

      print(response.body);
      List<MessageModel> messages = List.from(state.messages);
      messages.add(MessageModel(
          senderId: event.senderId,
          receiverId: event.receiverId,
          message: event.message));

      emit(ChatPageMessagesLoadedState(messages: messages));

      print(messages);
    } catch (e) {
      print(e);
    }
  }
}
