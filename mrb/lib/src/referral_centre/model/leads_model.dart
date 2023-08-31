class LeadModel {
  LeadModel(
      {required this.id,
      required this.senderAgent,
      required this.isBuyer,
      required this.city,
      required this.desiredDate,
      required this.price,
      required this.state});

  final int id;
  final int senderAgent;
  final bool isBuyer;
  final String city;
  final String state;
  final DateTime desiredDate;
  final double price;

  static LeadModel fromJson(Map<String, dynamic> json) => LeadModel(
      id: json['id'],
      senderAgent: json['senderAgent'],
      isBuyer: json['isBuyer'],
      city: json['city'],
      desiredDate: DateTime.parse(json['desiredDate']),
      price: json['price'].toDouble(),
      state: json['state']);
}
