import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  LargeButton({this.myText, this.startColor, this.endColor, this.onPressed});

  final String myText;
  final Color startColor;
  final Color endColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      onPressed: onPressed,
      textColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [startColor, endColor],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        child: Text(myText, style: TextStyle(fontSize: 25)),
      ),
    );
  }
}
