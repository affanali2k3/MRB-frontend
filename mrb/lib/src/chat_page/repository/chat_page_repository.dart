import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mrb/global_variables.dart';

class ChatPageRepository {
  Future<Response> getAllChat(
      {required String userOneEmail, required String userTwoEmail}) async {
    try {
      final Response response = await http.post(
          Uri.parse('${GlobalVariables.url}/chat/getAll'),
          body: {"userOneEmail": userOneEmail, "userTwoEmail": userTwoEmail});
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> saveMessage(
      {required String senderEmail,
      required String receiverEmail,
      required String message}) async {
    try {
      final Response response = await http
          .post(Uri.parse('${GlobalVariables.url}/chat/save'), body: {
        "senderEmail": senderEmail,
        "receiverEmail": receiverEmail,
        "message": message
      });
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
