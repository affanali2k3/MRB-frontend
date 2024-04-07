class UserModel {
  UserModel(
      {required this.email,
      required this.id,
      required this.name,
      required this.biography,
      required this.coverPhoto,
      required this.photo,
      required this.address,
      required this.completedDeals,
      required this.phone,
      required this.licenseState,
      required this.licenseNumber,
      required this.licenseYear,
      required this.agentToAgentRatingNumber,
      required this.agentToAgentRatingScore,
      required this.housesBought,
      required this.housesSold,
      required this.referralsReceived,
      required this.referralsSent,
      required this.yearsOfExperience,
      required this.gender});
  final String email;
  final int id;
  final String name;
  final String? address;
  final String? biography;
  final String? photo;
  final String? coverPhoto;
  final int? completedDeals;
  final String? phone;
  final String? gender;
  final String? licenseState;
  final int? licenseYear;
  final String? licenseNumber;
  final num agentToAgentRatingScore;
  final int agentToAgentRatingNumber;
  final int referralsSent;
  final int yearsOfExperience;
  final int housesBought;
  final int housesSold;
  final int referralsReceived;

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'],
        id: json['id'],
        name: json['name'],
        agentToAgentRatingNumber: json['AgentAnalytic']
            ['agentToAgentRatingNumber'],
        agentToAgentRatingScore: json['AgentAnalytic']
            ['agentToAgentRatingScore'],
        referralsReceived: json['AgentAnalytic']['referralsReceived'],
        referralsSent: json['AgentAnalytic']['referralsSent'],
        yearsOfExperience: json['AgentAnalytic']['yearsOfExperience'],
        housesBought: json['AgentAnalytic']['housesBought'],
        housesSold: json['AgentAnalytic']['housesSold'],
        biography: json['biography'],
        coverPhoto: json['coverPhoto'],
        licenseState: json['licenseState'],
        licenseYear: json['licenseYear'],
        licenseNumber: json['licenseNumber'],
        photo: json['photo'],
        address: json['address'],
        completedDeals: json['completedDeals'],
        phone: json['phone'],
        gender: json['gender']);
  }
}
