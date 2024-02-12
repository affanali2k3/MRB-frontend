import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mrb/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint("App started");
  await Firebase.initializeApp();
  runApp(const App());
}
