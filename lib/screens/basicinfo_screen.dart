import 'package:appcup/components/large_btn.dart';
import 'package:appcup/constants.dart';
import 'package:appcup/screens/logindetails_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appcup/components/inputfield.dart';
import 'package:appcup/models/user.dart';

class BasicInfoScreen extends StatefulWidget {
  @override
  _BasicInfoScreenState createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  String name;
  String address;
  String phoneNum;
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset('assets/images/welcomeimage.jfif'),
                Positioned.fill(
                  top: 220,
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Let\'s make a difference by ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              TextSpan(
                                text: 'donating',
                                style: TextStyle(
                                    shadows: shadows,
                                    fontWeight: FontWeight.bold,
                                    color: kTextColor),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Let\'s start by entering your\nbasic information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            InputField(
              textPlaceholder: 'Name',
              iconName: 'UserIcon.png',
              textType: TextInputType.text,
              onChanged: (value) {
                name = value;
              },
            ),
            InputField(
              textPlaceholder: 'Address',
              iconName: 'AddressIcon.png',
              textType: TextInputType.text,
              onChanged: (value) {
                address = value;
              },
            ),
            InputField(
              textPlaceholder: 'Phone Number',
              iconName: 'PhoneIcon.png',
              textType: TextInputType.phone,
              onChanged: (value) {
                phoneNum = value;
              },
            ),
            SizedBox(
              height: 70,
            ),
            Hero(
              tag: 'bottombtn',
              child: LargeButton(
                myText: 'Next',
                startColor: Color(0xFF00C14D),
                endColor: Color(0xFF02DB96),
                onPressed: () {
                  try {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginDetailsScreen(
                                  name: name,
                                  address: address,
                                  phoneNum: phoneNum,
                                )));
                  } catch (e) {
                    print(e);
                    Navigator.pushNamed(context, '/basicinfo_screen');
                  }
                  print(name);
                  print(address);
                  print(phoneNum);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
