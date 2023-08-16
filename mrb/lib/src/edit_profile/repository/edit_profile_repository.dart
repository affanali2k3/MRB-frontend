import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:mrb/global_variables.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mrb/src/edit_profile/model/deal_model.dart';

class ProfileRepository {
  Future<void> setProfile(
      {required name,
      required ssn,
      required String licence,
      required mimeType,
      required buffer,
      required occupation,
      required licenceState,
      required licenceNumber,
      required yearLicenced,
      required completedDeals,
      required address,
      required List<Deal> previousDeals,
      required phone,
      required gender}) async {
    try {
      var request = http.MultipartRequest(
          'PATCH', Uri.parse('${GlobalVariables.url}/user/a'));

      if (buffer != null) {
        final httpImage = http.MultipartFile.fromBytes('avatar', buffer,
            contentType: MediaType.parse(mimeType), filename: 'avatar.png');
        request.files.add(httpImage);
      }

      request.fields['name'] = name;
      request.fields['ssn'] = ssn;
      request.fields['licence'] = licence;
      request.fields['occupation'] = occupation;
      request.fields['gender'] = gender;
      request.fields['phone'] = phone;
      request.fields['email'] = FirebaseAuth.instance.currentUser?.email ?? "";
      request.fields['address'] = address;
      request.fields['licenceState'] = licenceState;
      request.fields['licenceNumber'] = licenceNumber;
      request.fields['yearLicenced'] = yearLicenced;
      request.fields['completedDeals'] = completedDeals;
      request.fields['previousDeals'] =
          jsonEncode(previousDeals.map((e) => e.toJson()).toList());

      final response = await request.send();
      final responseDate = await response.stream.bytesToString();
      if (response.statusCode == 500) throw Exception('Failed to save profile');
      print(responseDate);
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
