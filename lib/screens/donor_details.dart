import 'package:appcup/controllers/authentication_controller.dart';
import 'package:appcup/models/user.dart';
import 'package:flutter/material.dart';

class DonorDetails extends StatelessWidget {

  final AuthenticationController _auth = AuthenticationController();

  OrganisationUserData organisation;

  DonorDetails({
    this.organisation
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          title: Text('NoHunger'),
          backgroundColor: Colors.green[400],
          elevation: 0.0,
        ),
        body: Container(
          child: ListView(
            children: <Widget> [
              Icon(
                Icons.account_balance, 
                color: Colors.green, 
                size: 220.0
              ),
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
                child: Container (
                  padding: new EdgeInsets.all(10.0),
                  child: Column (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Text(
                        organisation.email,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.green[400]),
                      ),
                      Text(
                        organisation.contact_no,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.green[400]),
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
                    ]
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:20),
                child: Column(
                  children: <Widget>[
                    Text('Ingredients', style: TextStyle(fontSize: 20),),
                    Card(
                        child: Container (

                        ),
                    ),
                    Text('2', style: TextStyle(fontSize: 200),),
                    Text('2', style: TextStyle(fontSize: 200),),
                    Text('2', style: TextStyle(fontSize: 200),),
                    Text('2', style: TextStyle(fontSize: 200),),
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
            child: Icon(Icons.account_balance, size: 50,),
            backgroundColor: Colors.green[400],
            onPressed: () {},
          ),
        ),
      );
  }
}