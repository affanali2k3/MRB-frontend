import 'package:mrb/src/network_page/model/user_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class GlobalVariables {
  static const String url = 'http://192.168.137.1:8080/api/v1';
  static late UserModel user;
  static late IO.Socket socket;
}
