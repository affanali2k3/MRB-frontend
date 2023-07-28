import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:mrb/global_variables.dart';

class ProfilePageRepository {
  Future<String> getUserDetails() async {
    try {
      final email = FirebaseAuth.instance.currentUser?.email;
      var response =
          await http.get(Uri.parse('${GlobalVariables.url}/user/$email'));
      return response.body;
    } catch (e) {
      return "null";
    }
  }
}
