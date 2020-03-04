import 'package:appcup/constants.dart';
import 'package:flutter/material.dart';
import 'package:appcup/components/reuseable_circle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserSelectScreen extends StatefulWidget {
  @override
  _UserSelectScreenState createState() => _UserSelectScreenState();
}

class _UserSelectScreenState extends State<UserSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 300.0,
            ),
            Text('Choose any one', style: TextStyle(
              color: Colors.white
            ),),
            Text('Welcome you are a?', style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500
            ),),
            SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Image.asset('assets/images/donator.png'),
                        decoration: BoxDecoration(
                          color: kTextColor,
                          shape: BoxShape.circle
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Donator')
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Image.asset('assets/images/organisation.png'),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Organisation'),
                      Text('You are a charity\norganisation that\ndonates food.')
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
