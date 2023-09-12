import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mrb/global_variables.dart';

class ProfilePageRepository {
  Future<String> getUserDetails({required String email}) async {
    try {
      var response =
          await http.get(Uri.parse('${GlobalVariables.url}/user/$email'));
      return response.body;
    } catch (e) {
      return "null";
    }
  }

  Future<Response> getAllAssociatesForUser({required int userId}) async {
    try {
      final Response response = await http.get(
          Uri.parse('${GlobalVariables.url}/associate/get-all?userId=$userId'));
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> sendAssociateEvent(
      {required String senderEmail, required String receiverEmail}) async {
    try {
      final Response response = await http.post(
          Uri.parse('${GlobalVariables.url}/associate/send'),
          body: {"senderEmail": senderEmail, "receiverEmail": receiverEmail});
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getAssociationStatus(
      {required String userName, required String associateEmail}) async {
    try {
      print(userName);
      print(associateEmail);
      final Response response = await http.post(
          Uri.parse('${GlobalVariables.url}/associate/status'),
          body: {"userEmail": userName, "associateEmail": associateEmail});
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> acceptAssociation(
      {required String senderEmail, required String receiverEmail}) async {
    try {
      final response = await http.patch(
          Uri.parse('${GlobalVariables.url}/associate/accept'),
          body: {"senderEmail": senderEmail, "receiverEmail": receiverEmail});
      print(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}
