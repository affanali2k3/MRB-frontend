class ChatModel {
  ChatModel(
      {required this.id,
      required this.userName,
      required this.userOneId,
      required this.userTwoId,
      required this.lastMessage,
      required this.numberOfUnreadMessages,
      required this.updatedAt,
      required this.isRead});

  final int id;
  final int userOneId;
  final int userTwoId;
  final String lastMessage;
  final bool isRead;
  final int numberOfUnreadMessages;
  final DateTime updatedAt;
  final String userName;

  static ChatModel fromJson(Map<String, dynamic> json) => ChatModel(
      id: json['id'],
      userName: json['User']['user_name'],
      userOneId: json['userOneId'],
      userTwoId: json['userTwoId'],
      lastMessage: json['lastMessage'],
      numberOfUnreadMessages: json['numberOfUnreadMessages'],
      updatedAt: DateTime.parse(json['updatedAt']),
      isRead: json['isRead']);
}
