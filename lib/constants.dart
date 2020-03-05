import 'package:flutter/material.dart';

const kGreenTextColor = Color(0xFF02DB96);

const kYellowTextColor = Color(0xFFDCD907);
const kYellowDarkerColor = Color(0xFFC1AE00);
const kDarkGrey = Color.fromRGBO(58, 66, 86, 1.0);
const kLightGrey = Color.fromRGBO(64, 75, 96, .9);

const kTextStyle =
    TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white);

const kTextStyleAccent = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: kGreenTextColor,
);

const shadows = <Shadow>[
  Shadow(
    offset: Offset(0.0, 0.0),
    blurRadius: 3.0,
    color: Color.fromARGB(255, 0, 0, 0),
  ),
];
