import 'package:flutter/material.dart';
import 'package:flutter_sample/my_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences: sharedPreferences));
}
