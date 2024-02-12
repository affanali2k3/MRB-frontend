import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mrb/global_variables.dart';

class ProfilePageRepository {
  Future<Response> getUserDetails({required int userId}) async {
    try {
      final Response response = await http.get(
          Uri.parse(
            '${GlobalVariables.url}/user/get/?userId=$userId',
          ),
          headers: {"authorization": GlobalVariables.authorization});
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getAllAssociatesForUser({required int userId}) async {
    try {
      final Response response = await http.get(
          Uri.parse('${GlobalVariables.url}/associate/get-all?userId=$userId'),
          headers: {"authorization": GlobalVariables.authorization});
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getAllPostsForUser({required int userId}) async {
    try {
      final Response response = await http.get(
          Uri.parse('${GlobalVariables.url}/post/get-all?userId=$userId'),
          headers: {"authorization": GlobalVariables.authorization});
      ;
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> sendAssociateEvent(
      {required int senderId, required int receiverId}) async {
    try {
      final Response response = await http
          .post(Uri.parse('${GlobalVariables.url}/associate/send'), body: {
        "senderId": senderId.toString(),
        "receiverId": receiverId.toString()
      }, headers: {
        "authorization": GlobalVariables.authorization
      });

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getAssociationStatus(
      {required int userId, required int associateId}) async {
    try {
      final Response response = await http
          .post(Uri.parse('${GlobalVariables.url}/associate/status'), body: {
        "userId": userId.toString(),
        "associateId": associateId.toString()
      }, headers: {
        "authorization": GlobalVariables.authorization
      });

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> acceptAssociation(
      {required int senderId, required int receiverId}) async {
    try {
      final Response response = await http
          .patch(Uri.parse('${GlobalVariables.url}/associate/accept'), body: {
        "senderId": senderId.toString(),
        "receiverId": receiverId.toString()
      }, headers: {
        "authorization": GlobalVariables.authorization
      });

      print(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}
