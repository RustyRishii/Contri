import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:contri/UI/Landing_page.dart';
import 'package:flutter/material.dart';
import 'notificationService.dart';
import 'UI/HomePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? finalNumber = prefs.getString("PhoneNumber");
  runApp(MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: finalNumber == null ? Landing_page() : HomePage()));
}