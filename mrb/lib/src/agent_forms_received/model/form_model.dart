class FormReceivedModel {
  final int id;
  final int senderAgentId;
  final String senderAgentName;
  final double senderAgentRating;
  final int senderAgentReferralsSent;
  final int senderAgentReferralsReceived;
  final DateTime sentAt;

  FormReceivedModel(
      {required this.id,
      required this.senderAgentId,
      required this.senderAgentName,
      required this.senderAgentRating,
      required this.senderAgentReferralsSent,
      required this.senderAgentReferralsReceived,
      required this.sentAt});

  static FormReceivedModel fromJson(Map<String, dynamic> json) =>
      FormReceivedModel(
        id: json['id'],
        senderAgentName: json['SenderAgentOpenForm']['User']['name'],
        senderAgentId: json['SenderAgentOpenForm']['senderAgent'],
        senderAgentRating: json['SenderAgentOpenForm']['User']['AgentAnalytic']
                ['agentToAgentRating']
            .toDouble(),
        senderAgentReferralsSent: json['SenderAgentOpenForm']['User']
            ['AgentAnalytic']['referralsSent'],
        senderAgentReferralsReceived: json['SenderAgentOpenForm']['User']
            ['AgentAnalytic']['referralsReceived'],
        sentAt: DateTime.parse(json['createdAt']),
      );
}
