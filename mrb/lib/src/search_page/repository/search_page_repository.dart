import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mrb/global_variables.dart';

class SearchPageRepository {
  Future<Response> search({required String searchQuery}) async {
    try {
      final Response response = await http
          .get(Uri.parse('${GlobalVariables.url}/search/name/$searchQuery'));
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
