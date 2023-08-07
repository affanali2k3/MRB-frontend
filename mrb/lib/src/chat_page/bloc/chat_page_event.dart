import 'package:equatable/equatable.dart';

abstract class ChatPageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChatPageSendMessageEvent extends ChatPageEvent {
  ChatPageSendMessageEvent(
      {required this.senderEmail,
      required this.receiverEmail,
      required this.message});
  final String senderEmail;
  final String receiverEmail;
  final String message;
}

class ChatPageLoadMessagesEvent extends ChatPageEvent {
  ChatPageLoadMessagesEvent(
      {required this.userOneEmail, required this.userTwoEmail});
  final String userOneEmail;
  final String userTwoEmail;
}
