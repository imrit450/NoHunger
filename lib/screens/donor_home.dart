import 'package:appcup/constants.dart';
import 'package:appcup/controllers/authentication_controller.dart';
import 'package:appcup/controllers/donor_home_controller.dart';
import 'package:appcup/models/user.dart';
import 'package:appcup/screens/organisations_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonorHome extends StatelessWidget {

  final AuthenticationController _auth = AuthenticationController();
  
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<OrganisationUserData>>.value(
      value: DonorHomeController().organisations,
      child: Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          title: Text("NoHunger"),
          backgroundColor: kGreenTextColor,
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
        body: Container(
          child: OrganisationsList()
        ),
      ),
    );
  }
}