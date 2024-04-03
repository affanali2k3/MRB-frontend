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
      required int userId}) async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('${GlobalVariables.url}/post/create'));

      if (images != null) {
        for (final image in images) {
          final httpImage = http.MultipartFile.fromBytes('images', image.bytes!,
              contentType: MediaType.parse(lookupMimeType(image.path!)!),
              filename: 'images.png');

          request.files.add(httpImage);
        }
      }

      final uniqueFolderName = DateTime.now().millisecondsSinceEpoch;

      print(userId);

      request.fields['userId'] = userId.toString();
      request.fields['postText'] = postText;
      request.fields['uniqueFolderName'] = uniqueFolderName.toString();

      print(request.fields);
      print(request.files);

      final response = await request.send();
      final responseDate = await response.stream.bytesToString();
      print(responseDate);

      if (response.statusCode == 500) {
        throw Exception(json.decode(responseDate)['message']);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
