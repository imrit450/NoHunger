import 'package:appcup/constants.dart';
import 'package:appcup/controllers/authentication_controller.dart';
import 'package:appcup/models/user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'donor_organisation_booking.dart';

class DonorDetails extends StatefulWidget {
  final OrganisationUserData organisation;
  const DonorDetails({Key key, this.organisation}) : super(key: key);

  @override
  _DonorDetailsState createState() => _DonorDetailsState();
}

class _DonorDetailsState extends State<DonorDetails> {
  int count = 0;
  int count1 = 0;
  int count2 = 0;
  int count3 = 0;
  int count4 = 0;
  final AuthenticationController _auth = AuthenticationController();

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
                  widget.organisation.name,
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
                  widget.organisation.email,
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
                  widget.organisation.address,
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
                  widget.organisation.contact_no,
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
                    FontAwesomeIcons.stream,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  widget.organisation.category,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              color: kLightGrey,
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.only(right: 12.0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          right: new BorderSide(
                              width: 1.0, color: Colors.white24))),
                  child: Icon(
                    FontAwesomeIcons.solidClock,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  widget.organisation.days_accept,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  Text(
                    'Dietary Rules',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: kLightGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.all(20),
                    child: Text(
                      widget.organisation.dietary_rules,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    'Items to donate',
                    style: TextStyle(fontSize: 20),
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                    color: kLightGrey,
                    child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.white24))),
                          child: Image.asset('assets/images/milk.png'),
                        ),
                        title: Text(
                          count != 0 ? "$count x Bottled Milk" : 'Bottled Milk',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            Icon(Icons.linear_scale,
                                color: Colors.yellowAccent),
                            Text(" Dairy",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (count >= 0) {
                                    count = count + 1;
                                  }
                                });
                              },
                              child: Icon(
                                Icons.keyboard_arrow_up,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (count > 0) {
                                    count = count - 1;
                                  }
                                });
                              },
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )),
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                    color: kLightGrey,
                    child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.white24))),
                          child: Image.asset('assets/images/bottledwateer.png'),
                        ),
                        title: Text(
                          count2 != 0
                              ? "$count2 x Bottled Water"
                              : 'Bottled Water',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            Icon(Icons.linear_scale,
                                color: Colors.yellowAccent),
                            Text(" Water",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (count2 >= 0) {
                                    count2++;
                                  }
                                });
                              },
                              child: Icon(
                                Icons.keyboard_arrow_up,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (count2 > 0) {
                                    count2++;
                                  }
                                });
                              },
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )),
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                    color: kLightGrey,
                    child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.white24))),
                          child: Image.asset('assets/images/cannedfood.png'),
                        ),
                        title: Text(
                          count3 != 0 ? "$count3 x Canned Food" : 'Canned Food',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            Icon(Icons.linear_scale,
                                color: Colors.yellowAccent),
                            Text(" Food", style: TextStyle(color: Colors.white))
                          ],
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (count3 >= 0) {
                                    count3 = count3 + 1;
                                  }
                                });
                              },
                              child: Icon(
                                Icons.keyboard_arrow_up,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (count3 > 0) {
                                    count3 = count3 - 1;
                                  }
                                });
                              },
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )),
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                    color: kLightGrey,
                    child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.white24))),
                          child: Image.asset('assets/images/meal.png'),
                        ),
                        title: Text(
                          count4 != 0 ? "$count4 x Meal" : 'Meal',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            Icon(Icons.linear_scale,
                                color: Colors.yellowAccent),
                            Text(" Food", style: TextStyle(color: Colors.white))
                          ],
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (count4 >= 0) {
                                    count4 = count4 + 1;
                                  }
                                });
                              },
                              child: Icon(
                                Icons.keyboard_arrow_up,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (count4 > 0) {
                                    count4 = count4 - 1;
                                  }
                                });
                              },
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )),
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                    color: kLightGrey,
                    child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.white24))),
                          child: Image.asset('assets/images/rice.jpg'),
                        ),
                        title: Text(
                          count1 != 0 ? "$count1 x Rice" : 'Rice',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            Icon(Icons.linear_scale,
                                color: Colors.yellowAccent),
                            Text(" Rice", style: TextStyle(color: Colors.white))
                          ],
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (count1 >= 0) {
                                    count1 = count1 + 1;
                                  }
                                });
                              },
                              child: Icon(
                                Icons.keyboard_arrow_up,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (count1 > 0) {
                                    count1 = count1 - 1;
                                  }
                                });
                              },
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DonorOragnisationBooking(
                                    organisation: widget.organisation,
                                  )));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 50,
                      height: 60,
                      margin:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                      color: kGreenTextColor,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text('Proceed with Donation',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold))),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
