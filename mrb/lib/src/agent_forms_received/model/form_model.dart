class FormReceivedModel {
  final int id;
  final int senderAgentId;
  final String senderAgentName;
  final double senderAgentRating;
  final int senderAgentYearsOfExperience;
  final int senderAgentlistingsSold;
  final int senderAgentHousesSold;
  final String proposal;
  final int? teamMembers;
  final DateTime sentAt;

  FormReceivedModel(
      {required this.id,
      required this.teamMembers,
      required this.proposal,
      required this.senderAgentId,
      required this.senderAgentName,
      required this.senderAgentRating,
      required this.senderAgentlistingsSold,
      required this.senderAgentHousesSold,
      required this.senderAgentYearsOfExperience,
      required this.sentAt});

  static FormReceivedModel fromJson(Map<String, dynamic> json) =>
      FormReceivedModel(
        id: json['id'],
        teamMembers: json['SenderAgentOpenForm']['User']['teamMembers'],
        proposal: json['proposal'],
        senderAgentName: json['SenderAgentOpenForm']['User']['name'],
        senderAgentId: json['SenderAgentOpenForm']['senderAgent'],
        senderAgentRating: json['SenderAgentOpenForm']['User']['AgentAnalytic']
                ['agentToAgentRating']
            .toDouble(),
        senderAgentlistingsSold: json['SenderAgentOpenForm']['User']
            ['AgentAnalytic']['listingsSold'],
        senderAgentHousesSold: json['SenderAgentOpenForm']['User']
            ['AgentAnalytic']['housesSold'],
        senderAgentYearsOfExperience: json['SenderAgentOpenForm']['User']
            ['AgentAnalytic']['yearsOfExperience'],
        sentAt: DateTime.parse(json['createdAt']),
      );
}
