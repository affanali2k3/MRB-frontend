import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/sender_agent_form/bloc/sender_agent_form_state.dart';

class SenderAgentFormRepository {
  Future<Response> createForm(
      {required String senderAgent,
      required String? receiverAgent,
      required FormType formType,
      required UserType userType,
      required String city,
      required String state,
      required DateTime desiredDate,
      required double price}) async {
    try {
      print('Before response');
      final Response response = await http.post(
          Uri.parse('${GlobalVariables.url}/senderAgentForm/create'),
          headers: {"content-type": "application/json"},
          body: jsonEncode({
            "senderAgent": senderAgent,
            "receiverAgent": receiverAgent,
            "formType": formType.name,
            "isBuyer": userType == UserType.buyer,
            "city": city,
            "state": state,
            "providence": '',
            "desiredDate": desiredDate.toString(),
            "price": price
          }));

      print(response.body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
