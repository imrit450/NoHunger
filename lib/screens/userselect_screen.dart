import 'package:appcup/components/large_btn.dart';
import 'package:appcup/constants.dart';
import 'package:flutter/material.dart';
import 'package:appcup/screens/basicinfo_screen.dart';
import 'package:appcup/screens/organisationbasicinfo_screen.dart';
import 'package:appcup/components/reuseable_circle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserSelectScreen extends StatefulWidget {
  @override
  _UserSelectScreenState createState() => _UserSelectScreenState();
}

class _UserSelectScreenState extends State<UserSelectScreen> {
  String selectedUser = 'Donator';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 80.0,
            ),
            Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.all(20),
                child: Image.asset('assets/images/logo.png')),
            Text(
              'Choose any one',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            Text(
              'Welcome you are a?',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedUser = 'Donator';
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 20, top: 20, bottom: 20, right: 10),
                          child: selectedUser == 'Donator'
                              ? Image.asset(
                                  'assets/images/donatorIconActive.png')
                              : Image.asset(
                                  'assets/images/donatorIconInactive.png'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Donator'),
                      Text(
                        'You will donate\nfood to the\nneedy.',
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedUser = 'Organisation';
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 20, top: 20, bottom: 20, right: 10),
                          child: selectedUser == 'Organisation'
                              ? Image.asset(
                                  'assets/images/organisationIconActive.png')
                              : Image.asset(
                                  'assets/images/organisationIconInactive.png'),
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Organisation'),
                      Text(
                        'You are a charity\norganisation that\ndonates food.',
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Hero(
              tag: 'bottombtn',
              child: LargeButton(
                myText: 'Continue',
                startColor: Color(0xFF00C14D),
                endColor: Color(0xFF02DB96),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => selectedUser == 'Donator' ? BasicInfoScreen(
                            userSelected: selectedUser,
                          ): OrganisationBasicInfo(userSelected: selectedUser,)));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
