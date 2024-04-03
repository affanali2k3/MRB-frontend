import 'package:flutter/material.dart';
import 'package:mrb/src/network_page/model/user_model.dart';
import 'package:mrb/src/referral_centre/model/user_preference_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class GlobalVariables {
  static const String url = 'http://10.0.2.2:8080/api/v1';
  static late UserModel user;
  static late String authorization;
  static late UserPreferenceModel preferences;
  static late IO.Socket socket;
  static late bool showSplashScreen;
  static final GlobalKey<ScaffoldState> mainPageScaffoldKey = GlobalKey();
}
