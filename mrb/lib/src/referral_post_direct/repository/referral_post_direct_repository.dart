import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mrb/global_variables.dart';

class ReferralPostDirectRepository {
  Future<Response> loadTopAgents() async {
    try {
      final Response response = await http
          .get(Uri.parse('${GlobalVariables.url}/recommend/getBestAgent'));

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> loadNetworkAgents() async {
    try {
      final Response response = await http
          .get(Uri.parse('${GlobalVariables.url}/recommend/getBestAgent'));

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
