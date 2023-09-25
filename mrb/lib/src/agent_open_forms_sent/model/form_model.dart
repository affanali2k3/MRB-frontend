class SentFormModel {
  final int id;
  final int senderAgent;
  final int receiverAgent;
  final bool isBuyer;
  final String city;
  final String state;
  final String receiverAgentName;
  final int timeAmount;
  final String status;

  SentFormModel({
    required this.id,
    required this.status,
    required this.receiverAgentName,
    required this.senderAgent,
    required this.receiverAgent,
    required this.isBuyer,
    required this.city,
    required this.state,
    required this.timeAmount,
  });

  static SentFormModel fromJson(Map<String, dynamic> json) => SentFormModel(
      id: json['id'],
      senderAgent: json['SenderAgentOpenForm']['senderAgent'],
      isBuyer: json['SenderAgentOpenForm']['isBuyer'],
      status: json['status'],
      receiverAgentName: json['SenderAgentOpenForm']['User']['name'],
      city: json['SenderAgentOpenForm']['city'],
      state: json['SenderAgentOpenForm']['state'],
      timeAmount: json['SenderAgentOpenForm']['timeAmount'],
      receiverAgent: json['receiverAgent']);
}
