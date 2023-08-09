import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mrb/global_variables.dart';

class UserTimelineRepository {
  Future<Response> loadTimeline({required String email}) async {
    try {
      final response =
          await http.get(Uri.parse('${GlobalVariables.url}/post/$email'));
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
