import 'package:flutter/material.dart';
import 'package:appcup/constants.dart';

class InputFieldYellow extends StatelessWidget {
  String textPlaceholder;
  String iconName;
  Function onChanged;
  TextInputType textType;
  bool obscure = false;
  Function validator;

  InputFieldYellow(
      {this.textPlaceholder,
      this.iconName,
      this.textType,
      this.onChanged,
      this.obscure = false,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(right: 0, left: 16, top: 20, bottom: 20),
            width: 45,
            child: Image.asset('assets/images/$iconName')),
        Container(
          width: (MediaQuery.of(context).size.width) - 80,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: TextFormField(
            validator: validator,
            autofocus: false,
            keyboardType: textType,
            obscureText: obscure,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: textPlaceholder,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kYellowTextColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kYellowTextColor, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
            ),

          ),
        ),
      ],
    );
  }
}
