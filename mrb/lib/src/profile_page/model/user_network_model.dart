class UserNetworkModel {
  final int id;
  final String name;
  final String email;
  final num agentToAgentRatingScore;
  final int agentToAgentRatingNumber;

  UserNetworkModel(
      {required this.id,
      required this.agentToAgentRatingNumber,
      required this.agentToAgentRatingScore,
      required this.email,
      required this.name});

  static UserNetworkModel fromJson(Map<String, dynamic> json) =>
      UserNetworkModel(
          id: json['id'],
          agentToAgentRatingNumber: json['AgentAnalytic']
              ['agentToAgentRatingNumber'],
          agentToAgentRatingScore: json['AgentAnalytic']
              ['agentToAgentRatingScore'],
          email: json['email'],
          name: json['name']);
}
