import 'package:flutter/material.dart';
import 'logindetails_screen.dart';
import 'package:appcup/constants.dart';

class DonorScreen extends StatefulWidget {
  final String donorName;

  DonorScreen({Key key, @required this.donorName}) : super(key: key);

  @override
  _DonorScreenState createState() => _DonorScreenState(donorName);
}

class _DonorScreenState extends State<DonorScreen> {
  String donorName;

  _DonorScreenState(name);
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
      child: Scaffold(
        appBar: AppBar(
          title: Text(donorName.toString()),
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                )
              ],
            ));
  }
}
