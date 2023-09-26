import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mrb/global_variables.dart';

class PostCommentsRepository {
  Future<Response> loadComments({required int postId}) async {
    try {
      final Response response =
          await http.get(Uri.parse('${GlobalVariables.url}/comment/$postId'));
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> saveComment(
      {required int postId, required String text}) async {
    try {
      final response =
          await http.post(Uri.parse('${GlobalVariables.url}/comment/'), body: {
        "userId": GlobalVariables.user.id.toString(),
        "postId": postId.toString(),
        "text": text
      });
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
