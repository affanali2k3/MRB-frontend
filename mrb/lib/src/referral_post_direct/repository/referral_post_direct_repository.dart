import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/referral_filters/bloc/referral_filters_state.dart';
import 'package:mrb/src/sender_agent_form/bloc/sender_agent_form_state.dart';

class ReferralPostDirectRepository {
  Future<Response> loadTopAgents(
      {required final String state,
      required final ClientType clientType}) async {
    try {
      final Response response = await http.get(Uri.parse(
          '${GlobalVariables.url}/recommend/getBestAgents?state=$state&clientType=${clientType.name}'));

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> loadNetworkAgents(
      {required final String state,
      required final ClientType clientType}) async {
    try {
      final Response response = await http.get(Uri.parse(
          '${GlobalVariables.url}/recommend/getBestAgents?state=$state&clientType=${clientType.name}'));

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> sendReferralToAgent(
      {required final int senderAgent,
      required final int receiverAgent,
      required final FormType formType,
      required final String state,
      required final String city,
      required final double price,
      required final DateTime desiredDate,
      required final ClientType clientType}) async {
    try {
      final Response response = await http.post(
          Uri.parse('${GlobalVariables.url}/senderAgentForm/create'),
          body: {
            'senderAgent': senderAgent.toString(),
            'receiverAgent': receiverAgent.toString(),
            'formType': formType.name,
            'isBuyer': clientType == ClientType.buyer ? 'true' : 'false',
            'city': city,
            'state': state,
            'providence': '',
            'price': price.toInt().toString(),
            'desiredDate': desiredDate.toString()
          });

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
