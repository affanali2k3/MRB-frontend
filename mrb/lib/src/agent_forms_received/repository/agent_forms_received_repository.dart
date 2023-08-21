import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/sender_agent_form/bloc/sender_agent_form_state.dart';

class AgentFormsReceivedRepository {
  Future<Response> getReceivedForms({required String userEmail}) async {
    try {
      final Response response = await http.get(Uri.parse(
          '${GlobalVariables.url}/senderAgentForm/getFormsReceived/$userEmail'));
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> sendProposal(
      {required String userEmail,
      required int senderAgentFormId,
      required String proposal}) async {
    try {
      final Response response = await http.post(
          Uri.parse('${GlobalVariables.url}/receiverAgentForm/create'),
          body: {
            "receiverAgent": userEmail,
            "formType": FormType.direct.name,
            "senderAgentFormId": senderAgentFormId.toString(),
            "proposal": proposal
          });
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
