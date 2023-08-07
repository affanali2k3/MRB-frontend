class ChatModel {
  ChatModel(
      {required this.senderEmail,
      required this.receiverEmail,
      required this.message});
  final String senderEmail;
  final String receiverEmail;
  final String message;

  static ChatModel fromJson(Map<String, dynamic> json) => ChatModel(
      senderEmail: json['senderEmail'],
      receiverEmail: json['receiverEmail'],
      message: json['message']);
}
