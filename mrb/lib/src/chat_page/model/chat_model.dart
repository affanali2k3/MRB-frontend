class MessageModel {
  MessageModel(
      {required this.senderId,
      required this.receiverId,
      required this.message});
  final int senderId;
  final int receiverId;
  final String message;

  static MessageModel fromJson(json) => MessageModel(
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      message: json['message']);
}
