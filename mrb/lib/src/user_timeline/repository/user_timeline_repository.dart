import 'package:flutter/foundation.dart';
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

  Future<void> likePost({required String email, required String postId}) async {
    try {
      final response = await http.post(
          Uri.parse('${GlobalVariables.url}/like/'),
          body: {"userEmail": email, "postId": postId});
      if (kDebugMode) {
        print(response.body);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> removeLike({required int postId, required int likeId}) async {
    try {
      final response = await http.delete(
          Uri.parse(
            '${GlobalVariables.url}/like/delete',
          ),
          body: {"postId": postId.toString(), "likeId": likeId.toString()});
      if (kDebugMode) {
        print(response.body);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
