class ReceivedFormModel {
  final int id;
  final String senderAgent;
  final String? receiverAgent;
  final bool isBuyer;
  final String city;
  final String state;
  final DateTime desiredDate;
  final double price;

  ReceivedFormModel(
      {required this.id,
      required this.senderAgent,
      required this.receiverAgent,
      required this.isBuyer,
      required this.city,
      required this.state,
      required this.desiredDate,
      required this.price});

  static ReceivedFormModel fromJson(Map<String, dynamic> json) =>
      ReceivedFormModel(
          id: json['id'],
          senderAgent: json['senderAgent'],
          isBuyer: json['isBuyer'],
          city: json['city'],
          state: json['state'],
          desiredDate: DateTime.parse(json['desiredDate']),
          price: json['price'].toDouble(),
          receiverAgent: json['receiverAgent']);
}
