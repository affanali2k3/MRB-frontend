import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/chat_panel_page/bloc/chat_panel_event.dart';
import 'package:mrb/src/chat_panel_page/bloc/chat_panel_state.dart';
import 'package:mrb/src/chat_panel_page/model/chat_panel_model.dart';
import 'package:mrb/src/chat_panel_page/repository/chat_panel_repository.dart';

class ChatPanelBloc extends Bloc<ChatPanelEvent, ChatPanelState> {
  ChatPanelBloc({required this.repository}) : super(ChatPanelInitialState()) {
    on<ChatPanelLoadingEvent>(_getChats);
    on<ChatPanelCreateChatEvent>(_createChat);
  }

  final ChatPanelRepository repository;

  void _getChats(ChatPanelLoadingEvent event, emit) async {
    try {
      final Response response =
          await repository.getChats(userId: GlobalVariables.user.id);

      final List<dynamic> responseJson = json.decode(response.body)['data'];

      final List<ChatModel> chats = [];

      for (final json in responseJson) {
        chats.add(ChatModel.fromJson(json));
      }

      emit(ChatPanelSuccessState(chats: chats));
    } catch (e) {
      print('Error $e');
      emit(ChatPanelFailedState(error: e.toString()));
    }
  }

  void _createChat(ChatPanelCreateChatEvent event, emit) async {
    try {
      final Response response = await repository.createChat(
          senderId: event.senderId,
          receiverId: event.receiverId,
          message: event.message);

      print(response.body);
    } catch (e) {
      print(e);
    }
  }
}
