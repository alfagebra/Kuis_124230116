import 'package:flutter/material.dart';
import 'package:kuis/screen/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Kuis', home: LoginPage());
  }
}
