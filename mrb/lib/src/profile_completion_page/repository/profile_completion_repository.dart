import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/profile_completion_page/bloc/profile_completion_bloc.dart';

class ProfileCompletionRepository {
  Future<Response> submit({required ProfileCompletionSubmitEvent event}) async {
    try {
      if (FirebaseAuth.instance.currentUser == null) {
        throw Exception("Not logged in");
      }
      print(FirebaseAuth.instance.currentUser);
      print(FirebaseAuth.instance.currentUser!.email);
      final Response response = await http.post(
          Uri.parse('${GlobalVariables.url}/registration/create'),
          headers: {
            "authorization": GlobalVariables.authorization,
            "content-type": "application/json",
          },
          body: json.encode({
            "email": FirebaseAuth.instance.currentUser!.email,
            "name": event.name,
            "referralCode": event.referralCode,
            "licenseNumber": event.licenseNumber,
            "licenseState": event.licenseState,
            "licenseYear": event.licenseYear,
            "phone": event.phone,
          }));

      if (response.statusCode == 500) {
        throw Exception(json.decode(response.body)['error']);
      }

      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
