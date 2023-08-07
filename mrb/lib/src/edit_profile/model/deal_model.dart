import 'dart:convert';
import 'dart:typed_data';

class Deal {
  Deal(
      {required this.propertyAddress,
      required this.listPrice,
      required this.soldPrice,
      required this.sellerSubsidy,
      required this.clientEmail,
      required this.dateOfClosing,
      required this.mimeType,
      required this.bytes});
  String propertyAddress;
  String listPrice;
  String soldPrice;
  String sellerSubsidy;
  String clientEmail;
  DateTime dateOfClosing;
  final String? mimeType;
  final Uint8List? bytes;
  final String? agentName = null;
  final String? agentCompany = null;
  final String? agentLocation = null;
  final String? agentEmail = null;
  final String? agentPhone = null;

  factory Deal.fromJson(Map<String, dynamic> json) {
    return Deal(
      propertyAddress: json['propertyAddress'],
      listPrice: json['listPrice'],
      soldPrice: json['soldPrice'],
      sellerSubsidy: json['sellerSubsidy'],
      clientEmail: json['clientEmail'],
      dateOfClosing: DateTime.parse(json['dateOfClosing']),
      mimeType: json['mimeType'],
      bytes: base64Decode(json['proof']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'propertyAddress': propertyAddress,
      'listPrice': listPrice,
      'soldPrice': soldPrice,
      'sellerSubsidy': sellerSubsidy,
      'clientEmail': clientEmail,
      'proof': base64Encode(bytes!),
      'dateOfClosing': dateOfClosing.toString()
    };
  }
}
