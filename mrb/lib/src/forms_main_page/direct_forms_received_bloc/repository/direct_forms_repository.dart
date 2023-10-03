import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mrb/global_variables.dart';

class DirectFormsRepository {
  Future<Response> loadForms({required final int userId}) async {
    try {
      final Response response = await http.get(Uri.parse(
          '${GlobalVariables.url}/senderAgentForm/getFormsReceived/$userId'));

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
