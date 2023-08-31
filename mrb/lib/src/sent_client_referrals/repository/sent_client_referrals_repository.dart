import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mrb/global_variables.dart';

class SentClientReferralsRepository {
  Future<Response> getClientReferralsSentOpenly(
      {required String userEmail}) async {
    try {
      final Response response = await http.get(Uri.parse(
          '${GlobalVariables.url}/senderAgentForm/getOpenFormsSent/$userEmail'));
      print(response.body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getClientReferralsSentDirectly(
      {required String userEmail}) async {
    try {
      final Response response = await http.get(Uri.parse(
          '${GlobalVariables.url}/senderAgentForm/getDirectFormsSent/$userEmail'));
      print(response.body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
