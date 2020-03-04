import 'package:appcup/screens/userselect_screen.dart';
import 'package:flutter/material.dart';
import 'package:appcup/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => WelcomeScreen(),
        '/userselect_screen': (BuildContext context) => UserSelectScreen(),
      },
    );
  }
}
