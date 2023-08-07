import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mrb/global_variables.dart';

class NetworkPageRepository {
  Future<Response> getAssociates() async {
    try {
      final response = await http.get(
        Uri.parse(
            '${GlobalVariables.url}/associate/getAll/${FirebaseAuth.instance.currentUser?.email}'),
      );
      return response;
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
