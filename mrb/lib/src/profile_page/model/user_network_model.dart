class UserNetworkModel {
  final int id;
  final String name;
  final String email;

  UserNetworkModel({required this.id, required this.email, required this.name});

  static UserNetworkModel fromJson(Map<String, dynamic> json) =>
      UserNetworkModel(
          id: json['id'], email: json['email'], name: json['name']);
}
