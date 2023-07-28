import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:mrb/global_variables.dart';
import 'package:http_parser/http_parser.dart';

class ProfileRepository {
  void setProfile(
      {required name,
      required ssn,
      required String licence,
      required mimeType,
      required buffer,
      required occupation,
      required phone,
      required gender}) async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('${GlobalVariables.url}/user'));

      final httpImage = http.MultipartFile.fromBytes('avatar', buffer,
          contentType: MediaType.parse(mimeType), filename: 'avatar.png');

      request.files.add(httpImage);
      request.fields['name'] = name;
      request.fields['ssn'] = ssn;
      request.fields['licence'] = licence;
      request.fields['occupation'] = occupation;
      request.fields['gender'] = gender;
      request.fields['phone'] = phone;
      request.fields['email'] = FirebaseAuth.instance.currentUser?.email ?? "";

      final response = await request.send();
      print(response.stream.bytesToString());
    } catch (e) {
      print(e);
    }
  }
}
