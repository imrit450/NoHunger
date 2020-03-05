import 'package:appcup/screens/Authentication/signin_screen.dart';
import 'package:appcup/screens/donor_home.dart';
import 'package:appcup/screens/userselect_screen.dart';
import 'package:flutter/material.dart';
import 'package:appcup/screens/welcome_screen.dart';
import 'screens/basicinfo_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/donor_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'GillSansMT'),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => WelcomeScreen(),
        '/userselect_screen': (BuildContext context) => UserSelectScreen(),
        '/basicinfo_screen': (BuildContext context) => BasicInfoScreen(),
        '/logindetails_screen': (BuildContext context) => LoginDetailsScreen(),
        '/donor_screen': (BuildContext context) => DonorHome(),
        '/signin_screen': (BuildContext context) => SignIn(),
      },
    );
  }
}
