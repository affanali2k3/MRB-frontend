import 'package:socket_io_client/socket_io_client.dart' as IO;

class GlobalVariables {
  static const String url = 'http://192.168.1.10:8080/api/v1';
  static late IO.Socket socket;
}
