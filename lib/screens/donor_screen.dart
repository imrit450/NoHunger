import 'package:appcup/screens/donor_home.dart';
import 'package:flutter/material.dart';
import 'package:appcup/controllers/authentication_controller.dart';
import 'package:appcup/controllers/donor_home_controller.dart';
import 'package:appcup/models/user.dart';
import 'package:appcup/screens/organisations_list.dart';
import 'package:appcup/models/list_page.dart';
import 'package:provider/provider.dart';

class DonorScreen extends StatefulWidget {
  final String donorName;

  final AuthenticationController _auth = AuthenticationController();

  DonorScreen({Key key, @required this.donorName}) : super(key: key);

  @override
  _DonorScreenState createState() => _DonorScreenState(donorName);
}

class _DonorScreenState extends State<DonorScreen> {
  String donorName;

  _DonorScreenState(donorName);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(donorName);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: StreamProvider<List<OrganisationUserData>>.value(
          value: DonorHomeController().organisations,
        child: DonorHome()
      )
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                )
              ],
            ));
  }
}
