class UserPreferenceModel {
  final String? state;
  final String? city;
  final int? maxTimeAmount;
  final int? minTimeAmount;
  final int? minCost;
  final int? maxCost;
  final String? clientType;
  final String? houseType;
  final int userId;

  UserPreferenceModel(
      {required this.state,
      required this.city,
      required this.clientType,
      required this.houseType,
      required this.maxCost,
      required this.maxTimeAmount,
      required this.minCost,
      required this.minTimeAmount,
      required this.userId});

  static UserPreferenceModel fromJson(Map<String, dynamic> json) =>
      UserPreferenceModel(
          state: json['state'],
          city: json['city'],
          clientType: json['clientType'],
          houseType: json['houseType'],
          maxCost: json['maxCost'],
          maxTimeAmount: json['maxTimeAmount'],
          minCost: json['minCost'],
          minTimeAmount: json['minTimeAmount'],
          userId: json['userId']);
}
