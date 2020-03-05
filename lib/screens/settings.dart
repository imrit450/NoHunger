import 'package:appcup/constants.dart';
import 'package:flutter/material.dart';
import 'package:appcup/controllers/authentication_controller.dart';

class Settings extends StatelessWidget {
  final AuthenticationController _auth = AuthenticationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGrey,
    );
  }
}
