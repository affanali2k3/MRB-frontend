class UserModel {
  UserModel(
      {required this.email,
      required this.id,
      required this.name,
      required this.biography,
      required this.coverPhoto,
      required this.photo,
      required this.address,
      required this.completedDeals,
      required this.phone,
      required this.gender});
  final String email;
  final int id;
  final String name;
  final String? address;
  final String? biography;
  final String? photo;
  final String? coverPhoto;
  final int? completedDeals;
  final String? phone;
  final String? gender;

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'],
        id: json['id'],
        name: json['name'],
        biography: json['biography'],
        coverPhoto: json['coverPhoto'],
        photo: json['photo'],
        address: json['address'],
        completedDeals: json['completedDeals'],
        phone: json['phone'],
        gender: json['gender']);
  }
}
