class MessageModel {
  MessageModel(
      {required this.senderEmail,
      required this.receiverEmail,
      required this.message});
  final String senderEmail;
  final String receiverEmail;
  final String message;

  static MessageModel fromJson(json) => MessageModel(
      senderEmail: json['senderEmail'],
      receiverEmail: json['receiverEmail'],
      message: json['message']);
}
