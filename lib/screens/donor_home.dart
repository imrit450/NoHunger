import 'package:appcup/constants.dart';
import 'package:appcup/controllers/authentication_controller.dart';
import 'package:appcup/controllers/donor_home_controller.dart';
import 'package:appcup/models/user.dart';
import 'package:appcup/screens/organisations_list.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'settings.dart';
import 'donations.dart';

class DonorHome extends StatefulWidget {
  @override
  _DonorHomeState createState() => _DonorHomeState();
}

class _DonorHomeState extends State<DonorHome> {
  final AuthenticationController _auth = AuthenticationController();
  final _pageOptions = [
    DonorHome(),
    Donations(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: StreamProvider<List<OrganisationUserData>>.value(
        value: DonorHomeController().organisations,
        child: Scaffold(
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(color: kDarkGrey),
            child: CurvedNavigationBar(
              color: Colors.white,
              backgroundColor: kDarkGrey,
              buttonBackgroundColor: Colors.white,
              height: 50,
              items: <Widget>[
                Icon(
                  FontAwesomeIcons.plus,
                  size: 20,
                  color: Colors.black,
                ),
                Icon(
                  FontAwesomeIcons.home,
                  size: 20,
                  color: Colors.black,
                ),
                Icon(
                  FontAwesomeIcons.cog,
                  size: 20,
                  color: Colors.black,
                ),
              ],
              animationDuration: Duration(milliseconds: 400),
              index: 1,
              onTap: (index) {
                setState(() {});
              },
            ),
          ),
          backgroundColor: kDarkGrey,
          appBar: AppBar(
            title: Text("NoHunger"),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('Logout'),
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.popAndPushNamed(context, '/welcome_screen');
                },
                textColor: Colors.white,
              )
            ],
          ),
          body: Container(child: OrganisationsList()),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Do you want to exit?'),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () async {
                    await _auth.signOut();
                    Navigator.pushNamed(context, '/');
                  },
                )
              ],
            ));
  }
}
