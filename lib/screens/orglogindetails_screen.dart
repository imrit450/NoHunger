import 'package:appcup/components/inputfieldyellow.dart';
import 'package:appcup/constants.dart';
import 'package:appcup/controllers/authentication_controller.dart';
import 'package:appcup/controllers/sign_up_donor.dart';
import 'package:appcup/controllers/sign_up_organisation.dart';
import 'organisation_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrgLoginDetailsScreen extends StatefulWidget {
  final String userSelected;
  final String name;
  final String address;
  final String phoneNum;
  final String brn;
  final String selectedCategory;

  OrgLoginDetailsScreen(
      {Key key,
      @required this.userSelected,
      @required this.name,
      @required this.address,
      @required this.phoneNum,
      @required this.brn,
      @required this.selectedCategory})
      : super(key: key);

  @override
  _OrgLoginDetailsScreenState createState() => _OrgLoginDetailsScreenState(
      userSelected, name, address, phoneNum, brn, selectedCategory);
}

class _OrgLoginDetailsScreenState extends State<OrgLoginDetailsScreen> {
  String userSelected;
  String name;
  String address;
  String phoneNum;
  String brn;
  String selectedCategory;
  String dietaryRules = "No Dietary Rules";
  String days_accept = "Everyday";

  _OrgLoginDetailsScreenState(this.userSelected, this.name, this.address,
      this.phoneNum, this.brn, this.selectedCategory);

  String email;
  String username;
  String password;
  String rePassword;
  final globalKey = GlobalKey<ScaffoldState>();

  bool correctEmail = false;
  bool correctPassword = false;

  SignUpDonorController signUpDonorController = new SignUpDonorController();
  SignUpOrganisationController signUpOrganisationController =
      new SignUpOrganisationController();
  AuthenticationController _auth = new AuthenticationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset('assets/images/child.jfif'),
                Positioned.fill(
                  bottom: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Make it happen, donate for a ',
                              style: TextStyle(
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(0.0, 0.0),
                                      blurRadius: 3.0,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ],
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            TextSpan(
                              text: 'change',
                              style: TextStyle(
                                  shadows: shadows,
                                  fontWeight: FontWeight.bold,
                                  color: kYellowTextColor),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Enter your login details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            InputFieldYellow(
              textPlaceholder: 'Email',
              iconName: 'yemailIcon.png',
              textType: TextInputType.emailAddress,
              onChanged: (value) {
                if (value.toString().contains("@gmail.com") &&
                    value.toString().length > 6) {
                  correctEmail = true;
                  email = value;
                }
              },
            ),
            InputFieldYellow(
              textPlaceholder: 'Username',
              iconName: 'yusername.png',
              textType: TextInputType.text,
              onChanged: (value) {
                username = value;
              },
            ),
            InputFieldYellow(
              textPlaceholder: 'Password',
              iconName: 'ypassword.png',
              textType: TextInputType.visiblePassword,
              obscure: true,
              onChanged: (value) {
                password = value;
              },
            ),
            InputFieldYellow(
              textPlaceholder: 'Repeat Password',
              iconName: 'yrepeatPassword.png',
              textType: TextInputType.visiblePassword,
              obscure: true,
              onChanged: (value) {
                if (password == value) {
                  correctPassword = true;
                  password = value;
                }
              },
            ),
            SizedBox(
              height: 70,
            ),
            Hero(
              tag: 'bottombtn',
              child: RaisedButton(
                padding: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                onPressed: () {
                  print(name);
                  try {
                    (correctEmail && correctPassword)
                        ? runAuthentication()
                        : globalKey.currentState.showSnackBar(SnackBar(
                            content: Text('Error with Email and Password')));
                  } catch (e) {
                    print(e);
                  }
                },
                textColor: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [kYellowTextColor, kYellowDarkerColor],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  child: Text('Confirm', style: TextStyle(fontSize: 25)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> runAuthentication() async {
    if (userSelected == "Organisation") {
      signUpOrganisationController.enterOrganisationData(name, phoneNum, email,
          address, brn, dietaryRules, days_accept, selectedCategory);
      _auth.registerWithEmailAndPassword(email, password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OrganisationHome()));
    }
  }
}
