class DirectFormModel {
  final int id;
  final int senderAgent;
  final int receiverAgent;
  final bool isBuyer;
  final String city;
  final String state;
  final int? timeAmount;
  final String? typeOfHouse;
  final int price;
  final DateTime createdAt;

  DirectFormModel({
    required this.city,
    required this.createdAt,
    required this.id,
    required this.isBuyer,
    required this.price,
    required this.senderAgent,
    required this.state,
    required this.typeOfHouse,
    required this.timeAmount,
    required this.receiverAgent,
  });

  static DirectFormModel fromJson(Map<String, dynamic> json) => DirectFormModel(
      city: json['city'],
      createdAt: DateTime.parse(json['createdAt']),
      id: json['id'],
      isBuyer: json['isBuyer'],
      price: json['price'],
      senderAgent: json['senderAgent'],
      state: json['state'],
      typeOfHouse: json['typeOfHouse'],
      timeAmount: json['timeAmount'],
      receiverAgent: json['receiverAgent']);
}
