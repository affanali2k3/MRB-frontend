import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mrb/global_variables.dart';

class ChatPanelRepository {
  Future<Response> getChats({required final int userId}) async {
    try {
      final Response response = await http.get(
          Uri.parse('${GlobalVariables.url}/chat/chat/get-all?userId=$userId'));

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> createChat(
      {required final int senderId,
      required final int receiverId,
      required final String message}) async {
    try {
      final Response response = await http
          .post(Uri.parse('${GlobalVariables.url}/chat/chat/create'), body: {
        'senderId': senderId.toString(),
        'receiverId': receiverId.toString(),
        'message': message
      });

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
