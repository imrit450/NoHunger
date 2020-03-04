import 'package:flutter/material.dart';
import 'package:appcup/constants.dart';
import 'package:appcup/components/large_btn.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage('assets/images/background.jfif'),
                fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 300.0,
            ),
            Text(
              'Welcome to\nCharity',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Enjoy the act of ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Charity',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 190,
            ),
            Hero(
              tag: 'bottombtn',
              child: LargeButton(
                myText: 'Get Started',
                startColor: kTextColor,
                endColor: kTextColor,
                onPressed: () {
                  Navigator.pushNamed(context, '/userselect_screen');
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Already a member? ',
                    style: kTextStyle,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/donor_screen');
                    },
                    child: Text(
                      'Sign In',
                      style: kTextStyleAccent,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
