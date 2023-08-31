class UserModel {
  UserModel(
      {required this.email,
      required this.id,
      this.name,
      this.address,
      this.completedDeals,
      this.photo,
      this.phone,
      this.gender});
  final String email;
  final int id;
  final String? name;
  final String? address;
  final int? completedDeals;
  final String? photo;
  final String? phone;
  final String? gender;

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'],
        id: json['id'],
        name: json['name'],
        address: json['address'],
        completedDeals: json['completedDeals'],
        photo: json['photo'],
        phone: json['phone'],
        gender: json['gender']);
  }
}
