import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mrb/global_variables.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mrb/src/network_page/model/user_model.dart';

class ProfileRepository {
  Future<void> setProfile(
      {required int userId,
      required String? avatarMimeType,
      required Uint8List? avatarBytes,
      required String name,
      required String address,
      required String licenseNumber,
      required int licenseYear,
      required String licenseState,
      required String phone,
      required String biography}) async {
    try {
      MultipartRequest request = http.MultipartRequest(
          'PATCH', Uri.parse('${GlobalVariables.url}/user/update'));

      request.fields['id'] = userId.toString();
      request.fields['biography'] = biography;
      request.fields['name'] = name;
      request.fields['phone'] = phone;
      request.fields['address'] = address;
      request.fields['licenseState'] = licenseState;
      request.fields['licenseNumber'] = licenseNumber;
      request.fields['licenseYear'] = licenseYear.toString();

      if (avatarBytes != null && avatarMimeType != null) {
        final MultipartFile avatar = http.MultipartFile.fromBytes(
            'avatar', avatarBytes,
            contentType: MediaType.parse(avatarMimeType), filename: 'avatar');

        request.files.add(avatar);
      }

      request.headers["authorization"] = GlobalVariables.authorization;

      final StreamedResponse response = await request.send();
      final String responseBody = await response.stream.bytesToString();

      final dynamic responseData = json.decode(responseBody);
      GlobalVariables.user = UserModel.fromJson(responseData['data']);

      if (response.statusCode == 500) throw Exception('Failed to save profile');
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
