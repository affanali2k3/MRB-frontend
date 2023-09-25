import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mrb/global_variables.dart';
import 'package:mrb/src/sender_agent_form/bloc/sender_agent_form_state.dart';

final class ReferralPostRepository {
  Future<Response> createOpenForm(
      {required final bool isBuyer,
      required final String state,
      required final String city,
      required final double price,
      required final int timeAmount,
      required final String houseType,
      required final FormType formType}) async {
    try {
      final Response response = await http.post(
          Uri.parse('${GlobalVariables.url}/senderAgentForm/create'),
          body: {
            'senderAgent': GlobalVariables.user.id.toString(),
            'formType': formType.name,
            'isBuyer': isBuyer.toString(),
            'city': city,
            'state': state,
            'price': price.toString(),
            "providence": "",
            'time_amount': timeAmount.toString(),
            "typeOfHouse": houseType,
            // "details": details
          });

      print(response.body);

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
