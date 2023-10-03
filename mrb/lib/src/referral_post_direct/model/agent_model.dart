class AgentModel {
  final int id;
  final int referralsSent;
  final double yearsOfExperience;
  final int listingsSold;
  final int housesSold;
  final int referralsReceived;
  final int agentToAgentRatingScore;
  final int agentToAgentRatingNumber;
  final int userId;
  final String name;
  final String photo;

  AgentModel(
      {required this.id,
      required this.name,
      required this.photo,
      required this.referralsSent,
      required this.referralsReceived,
      required this.agentToAgentRatingNumber,
      required this.agentToAgentRatingScore,
      required this.housesSold,
      required this.listingsSold,
      required this.userId,
      required this.yearsOfExperience});

  static AgentModel fromJson(Map<String, dynamic> json) => AgentModel(
      id: json['id'],
      referralsSent: json['referralsSent'],
      name: json['User']['name'],
      photo: json['User']['photo'],
      referralsReceived: json['referralsReceived'],
      agentToAgentRatingNumber: json['agentToAgentRatingNumber'],
      agentToAgentRatingScore: json['agentToAgentRatingScore'],
      housesSold: json['housesSold'],
      listingsSold: json['listingsSold'],
      userId: json['userId'],
      yearsOfExperience: json['yearsOfExperience'].toDouble());
}
