import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mrb/global_variables.dart';

class FeedPageRepository {
  Future<Response> loadPosts({required String userEmail}) async {
    try {
      final Response response =
          await http.get(Uri.parse('${GlobalVariables.url}/feed/$userEmail'));

      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
