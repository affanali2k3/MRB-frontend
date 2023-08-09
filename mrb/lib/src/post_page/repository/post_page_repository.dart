import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:mrb/global_variables.dart';
import 'package:http_parser/http_parser.dart';

class PostPageRepository {
  Future<void> submit(
      {required String postText,
      required List<PlatformFile>? images,
      required String userEmail}) async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('${GlobalVariables.url}/post/'));

      if (images != null) {
        for (final image in images) {
          final httpImage = http.MultipartFile.fromBytes('images', image.bytes!,
              contentType: MediaType.parse(lookupMimeType(image.path!)!),
              filename: 'images.png');

          request.files.add(httpImage);
        }
      }

      final uniqueFolderName = DateTime.now().millisecondsSinceEpoch;

      request.fields['userEmail'] = userEmail;
      request.fields['postText'] = postText;
      request.fields['uniqueFolderName'] = uniqueFolderName.toString();

      final response = await request.send();
      final responseDate = await response.stream.bytesToString();

      if (response.statusCode == 500) {
        throw Exception(json.decode(responseDate)['message']);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
