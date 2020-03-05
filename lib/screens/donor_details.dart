import 'package:appcup/constants.dart';
import 'package:appcup/controllers/authentication_controller.dart';
import 'package:appcup/models/user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DonorDetails extends StatelessWidget {
  final AuthenticationController _auth = AuthenticationController();

  OrganisationUserData organisation;

  DonorDetails({this.organisation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGrey,
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.white),
              margin: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Container(
                padding: EdgeInsets.all(10),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset('assets/images/mwflogo.png'),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              color: kLightGrey,
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.only(right: 12.0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          right: new BorderSide(
                              width: 1.0, color: Colors.white24))),
                  child: Icon(
                    FontAwesomeIcons.users,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  organisation.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              color: kLightGrey,
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.only(right: 12.0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          right: new BorderSide(
                              width: 1.0, color: Colors.white24))),
                  child: Icon(
                    FontAwesomeIcons.at,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  organisation.email,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              color: kLightGrey,
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.only(right: 12.0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          right: new BorderSide(
                              width: 1.0, color: Colors.white24))),
                  child: Icon(
                    FontAwesomeIcons.map,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  organisation.address,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              color: kLightGrey,
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.only(right: 12.0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          right: new BorderSide(
                              width: 1.0, color: Colors.white24))),
                  child: Icon(
                    FontAwesomeIcons.phoneAlt,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  organisation.contact_no,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Icon(Icons.account_balance, color: Colors.green, size: 220.0),
            Text(
              organisation.name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.green[400]),
            ),
            Text(
              organisation.address,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.green[400]),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: Container(
                padding: new EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        organisation.email,
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 16, color: Colors.green[400]),
                      ),
                      Text(
                        organisation.contact_no,
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 16, color: Colors.green[400]),
                      ),
                      // Text(
                      //   organisation.brn_no,
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(fontSize: 16, color: Colors.green[400]),
                      // ),
                      // Text(
                      //   organisation.days_accept,
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(fontSize: 16, color: Colors.green[400]),
                      // ),
                    ]),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  Text(
                    'Ingredients',
                    style: TextStyle(fontSize: 20),
                  ),
                  Card(
                    child: Container(),
                  ),
                  Text(
                    '2',
                    style: TextStyle(fontSize: 200),
                  ),
                  Text(
                    '2',
                    style: TextStyle(fontSize: 200),
                  ),
                  Text(
                    '2',
                    style: TextStyle(fontSize: 200),
                  ),
                  Text(
                    '2',
                    style: TextStyle(fontSize: 200),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 70.0,
        width: 70.0,
        child: FloatingActionButton(
          child: Icon(
            Icons.account_balance,
            size: 50,
          ),
          backgroundColor: Colors.green[400],
          onPressed: () {},
        ),
      ),
    );
  }
}
