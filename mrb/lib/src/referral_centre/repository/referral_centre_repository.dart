import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/sender_agent_form/bloc/sender_agent_form_state.dart';

class ReferralCentreRepository {
  Future<Response> searchDefaultLeads(
      {required String? state, required String? city}) async {
    try {
      final Response response = await http.get(Uri.parse(
          '${GlobalVariables.url}/referral-center/search?${state == null ? '' : 'state=$state'}&${city == null ? '' : 'city=$city'}'));
      print(response.body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> applyForLead(
      {required final int receiverAgentId,
      required final int senderAgentFormId,
      required final String proposal}) async {
    try {
      final Response response = await http.post(
          Uri.parse('${GlobalVariables.url}/receiverAgentForm/create'),
          body: {
            "receiverAgent": receiverAgentId.toString(),
            "formType": FormType.open.name,
            "senderAgentFormId": senderAgentFormId.toString(),
            "proposal": proposal
          });
      print(response.body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
