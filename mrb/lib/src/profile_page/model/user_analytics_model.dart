class UserAnalyticsModel {
  final int id;
  final int referralsSent;
  final int yearsOfExperience;
  final int housesBought;
  final int housesSold;
  final int referralsReceived;
  final num agentToAgentRatingScore;
  final int agentToAgentRatingNumber;
  final int userId;
  final DateTime updatedAt;

  UserAnalyticsModel(
      {required this.id,
      required this.referralsSent,
      required this.yearsOfExperience,
      required this.housesBought,
      required this.housesSold,
      required this.referralsReceived,
      required this.agentToAgentRatingScore,
      required this.agentToAgentRatingNumber,
      required this.userId,
      required this.updatedAt});

  static UserAnalyticsModel fromJson(Map<String, dynamic> json) =>
      UserAnalyticsModel(
          id: json['id'],
          referralsSent: json['referralsSent'],
          yearsOfExperience: json['yearsOfExperience'],
          housesBought: json['housesBought'],
          housesSold: json['housesSold'],
          referralsReceived: json['referralsReceived'],
          agentToAgentRatingScore: json['agentToAgentRatingScore'],
          agentToAgentRatingNumber: json['agentToAgentRatingNumber'],
          userId: json['userId'],
          updatedAt: DateTime.parse(json['updatedAt']));
}
