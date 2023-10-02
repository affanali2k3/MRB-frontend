import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mrb/global_variables.dart';
import 'package:http_parser/http_parser.dart';

class ProfileRepository {
  Future<void> setProfile(
      {required final int userId,
      required String avatarMimeType,
      required Uint8List? avatarBytes,
      required String coverMimeType,
      required Uint8List? coverBytes,
      required final String biography}) async {
    try {
      MultipartRequest request = http.MultipartRequest(
          'PATCH', Uri.parse('${GlobalVariables.url}/user/update'));

      request.fields['id'] = userId.toString();
      request.fields['biography'] = biography;

      if (avatarBytes != null) {
        final MultipartFile avatar = http.MultipartFile.fromBytes(
            'avatar', avatarBytes,
            contentType: MediaType.parse(avatarMimeType),
            filename: 'avatar.png');

        request.files.add(avatar);
      }
      if (coverBytes != null) {
        final MultipartFile coverPhoto = http.MultipartFile.fromBytes(
            'coverPhoto', coverBytes,
            contentType: MediaType.parse(coverMimeType),
            filename: 'coverPhoto.png');

        request.files.add(coverPhoto);
      }

      final StreamedResponse response = await request.send();
      final String responseData = await response.stream.bytesToString();

      print(responseData);
      if (response.statusCode == 500) throw Exception('Failed to save profile');
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
