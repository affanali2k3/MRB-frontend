import 'package:http/http.dart' as http;
import 'package:mrb/global_variables.dart';

class LoginRepository {
  void setProfile({required email}) async {
    try {
      final response =
          await http.post(Uri.parse('${GlobalVariables.url}/user'), body: {
        "email": email,
      });
      print(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}
