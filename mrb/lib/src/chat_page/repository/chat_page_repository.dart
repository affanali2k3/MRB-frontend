import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mrb/global_variables.dart';

class ChatPageRepository {
  Future<Response> getAllChat(
      {required int userOneId, required int userTwoId}) async {
    try {
      final Response response = await http
          .post(Uri.parse('${GlobalVariables.url}/chat/getAll'), body: {
        "userOneId": userOneId.toString(),
        "userTwoId": userTwoId.toString()
      });
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> saveMessage(
      {required int senderId,
      required int receiverId,
      required String message}) async {
    try {
      final Response response =
          await http.post(Uri.parse('${GlobalVariables.url}/chat/save'), body: {
        "senderId": senderId.toString(),
        "receiverId": receiverId.toString(),
        "message": message
      });
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
