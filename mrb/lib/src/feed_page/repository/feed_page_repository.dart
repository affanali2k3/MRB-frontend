import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mrb/global_variables.dart';

class FeedPageRepository {
  Future<Response> loadPosts(
      {required int userId, required int pageNumber}) async {
    try {
      final Response response = await http.get(Uri.parse(
          '${GlobalVariables.url}/feed/get/?userId=$userId&page=$pageNumber'));

      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> likePost({required int userId, required int postId}) async {
    try {
      final response = await http.post(
          Uri.parse('${GlobalVariables.url}/like/'),
          body: {"userId": userId.toString(), "postId": postId.toString()});

      print(response.body);
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
      print(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}
