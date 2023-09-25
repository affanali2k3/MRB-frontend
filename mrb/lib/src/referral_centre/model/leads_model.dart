class LeadModel {
  LeadModel(
      {required this.id,
      required this.senderAgent,
      required this.isBuyer,
      required this.city,
      required this.price,
      required this.typeOfHouse,
      required this.timeAmount,
      required this.postedAt,
      required this.state});

  final int id;
  final int senderAgent;
  final bool isBuyer;
  final String city;
  final String typeOfHouse;
  final String state;
  final int timeAmount;
  final double price;
  final DateTime postedAt;

  static LeadModel fromJson(Map<String, dynamic> json) => LeadModel(
      id: json['id'],
      senderAgent: json['senderAgent'],
      isBuyer: json['isBuyer'],
      city: json['city'],
      postedAt: DateTime.parse(json['createdAt']),
      timeAmount: json['timeAmount'],
      typeOfHouse: json['typeOfHouse'],
      price: json['price'].toDouble(),
      state: json['state']);
}
