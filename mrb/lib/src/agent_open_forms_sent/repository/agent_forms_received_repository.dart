import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mrb/global_variables.dart';

class AgentOpenFormsSentRepository {
  Future<Response> getOpenFormsSent({required int userId}) async {
    try {
      final Response response = await http.get(
          Uri.parse(
              '${GlobalVariables.url}/receiverAgentForm/open-forms-sent?userId=$userId'),
          headers: {"authorization": GlobalVariables.authorization});
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
