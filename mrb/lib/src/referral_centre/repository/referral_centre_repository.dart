import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mrb/global_variables.dart';

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
}
