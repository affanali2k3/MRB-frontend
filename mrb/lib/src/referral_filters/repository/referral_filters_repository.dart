import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mrb/global_variables.dart';

class ReferralFiltersRepository {
  Future<Response> updatePreferences(
      {required int? minTimeAmount,
      required int? maxTimeAmount,
      required int? minCost,
      required int? maxCost,
      required String? clientType,
      required String? typeOfHouse,
      required String? state,
      required int userId,
      required String? city}) async {
    try {
      final Response response = await http.patch(
          Uri.parse('${GlobalVariables.url}/preferences/update'),
          headers: {
            "authorization": GlobalVariables.authorization,
            "content-type": "application/json",
          },
          body: json.encode({
            'state': state,
            'city': city,
            'minTimeAmount': minTimeAmount,
            'minCost': minCost,
            'maxCost': maxCost,
            'clientType': clientType,
            'houseType': typeOfHouse,
            'maxTimeAmount': maxTimeAmount,
            'userId': userId
          }));

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
