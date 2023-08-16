import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mrb/global_variables.dart';

class PostCommentsRepository {
  Future<Response> loadComments({required String postId}) async {
    try {
      final Response response =
          await http.get(Uri.parse('${GlobalVariables.url}/comment/$postId'));
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> saveComment(
      {required String postId, required String text}) async {
    try {
      final response =
          await http.post(Uri.parse('${GlobalVariables.url}/comment/'), body: {
        "userEmail": FirebaseAuth.instance.currentUser!.email,
        "postId": postId,
        "text": text
      });
      print(response.body);
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
