class UserAssociationModel {
  UserAssociationModel(
      {required this.senderId, required this.receiverId, required this.status});
  final int senderId;
  final int receiverId;
  final String status;

  static UserAssociationModel? fromJson(Map<String, dynamic> json) =>
      UserAssociationModel(
          senderId: json['userId'],
          receiverId: json['associateId'],
          status: json['status']);
}
