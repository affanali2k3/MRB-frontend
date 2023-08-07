class UserModel {
  UserModel(
      {required this.email,
      this.name,
      this.address,
      this.completedDeals,
      this.photo,
      this.phone,
      this.gender});
  final String email;
  String? name;
  String? address;
  String? completedDeals;
  String? photo;
  String? phone;
  String? gender;

  static UserModel toJSON(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'],
        name: json['name'],
        address: json['address'],
        completedDeals: json['completedDeals'],
        photo: json['photo'],
        phone: json['phone'],
        gender: json['gender']);
  }
}
