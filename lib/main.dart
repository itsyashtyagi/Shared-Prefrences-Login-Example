import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences/screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Prefrences Flutter',
      home: LoginScreen(),
    );
  }
}
