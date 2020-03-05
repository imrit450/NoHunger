import 'package:appcup/constants.dart';
import 'package:appcup/controllers/authentication_controller.dart';
import 'package:appcup/controllers/donor_home_controller.dart';
import 'package:appcup/models/user.dart';
import 'package:appcup/screens/organisations_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrganisationHome extends StatefulWidget {
  @override
  _OrganisationHomeState createState() => _OrganisationHomeState();
}

class _OrganisationHomeState extends State<OrganisationHome> {
  final AuthenticationController _auth = AuthenticationController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: StreamProvider<List<OrganisationUserData>>.value(
        value: DonorHomeController().organisations,
        child: Scaffold(
          backgroundColor: Colors.yellow[50],
          appBar: AppBar(
            title: Text("NoHunger"),
            backgroundColor: Colors.yellow,
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
