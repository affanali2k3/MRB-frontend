class UserAssociationModel {
  UserAssociationModel(
      {required this.senderEmail,
      required this.receiverEmail,
      required this.status});
  final String senderEmail;
  final String receiverEmail;
  final String status;

  static UserAssociationModel? fromJson(Map<String, dynamic> json) =>
      UserAssociationModel(
          senderEmail: json['userEmail'],
          receiverEmail: json['associateEmail'],
          status: json['status']);
}
