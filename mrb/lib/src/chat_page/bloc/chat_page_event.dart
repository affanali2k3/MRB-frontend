import 'package:equatable/equatable.dart';

abstract class ChatPageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChatPageSendMessageEvent extends ChatPageEvent {
  ChatPageSendMessageEvent(
      {required this.senderId,
      required this.receiverId,
      required this.message});
  final int senderId;
  final int receiverId;
  final String message;
}

class ChatPageLoadMessagesEvent extends ChatPageEvent {
  ChatPageLoadMessagesEvent({required this.userOneId, required this.userTwoId});
  final int userOneId;
  final int userTwoId;
}
