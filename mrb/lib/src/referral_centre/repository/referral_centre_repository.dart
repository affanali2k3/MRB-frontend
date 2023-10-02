import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/referral_centre/model/user_preference_model.dart';
import 'package:mrb/src/sender_agent_form/bloc/sender_agent_form_state.dart';

class ReferralCentreRepository {
  Future<Response> searchDefaultLeads(
      {required UserPreferenceModel preferences}) async {
    try {
      print(preferences.state);
      print(preferences.city);
      print(preferences.maxCost);
      print(preferences.minCost);
      print(preferences.clientType);
      print(preferences.houseType);
      print(preferences.minTimeAmount);
      print(preferences.maxTimeAmount);
      String state = '';
      String city = '';
      String maxCost = '';
      String minCost = '';
      String clientType = '';
      String houseType = '';
      String minTimeAmount = '';
      String maxTimeAmount = '';

      if (preferences.state != null) {
        state = 'state=${preferences.state}';
      }
      if (preferences.city != null) {
        city = 'city=${preferences.city}';
      }
      if (preferences.maxCost != null) {
        maxCost = 'maxCost=${preferences.maxCost}';
      }
      if (preferences.minCost != null) {
        minCost = 'minCost=${preferences.minCost}';
      }
      if (preferences.clientType != null) {
        clientType = 'clientType=${preferences.clientType}';
      }
      if (preferences.houseType != null) {
        houseType = 'houseType=${preferences.houseType}';
      }
      if (preferences.minTimeAmount != null) {
        minTimeAmount = 'minTimeAmount=${preferences.minTimeAmount}';
      }
      if (preferences.maxTimeAmount != null) {
        maxTimeAmount = 'maxTimeAmount=${preferences.maxTimeAmount}';
      }

      final Response response = await http.get(Uri.parse(
          '${GlobalVariables.url}/referral-center/search?$state&$city&$minCost&$maxCost&$clientType&$houseType&$minTimeAmount&$maxTimeAmount'));
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
