import 'package:appcup/constants.dart';
import 'package:appcup/controllers/donations_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import 'donor_home.dart';

class DonorOragnisationBooking extends StatefulWidget {
  final OrganisationUserData organisation;
  DonorOragnisationBooking({
    Key key,
    @required this.organisation,
  }) : super(key: key);
  @override
  _DonorOragnisationBookingState createState() =>
      _DonorOragnisationBookingState(organisation);
}

class _DonorOragnisationBookingState extends State<DonorOragnisationBooking> {
  String ingredients;
  DateTime date;
  String time;
  String calories;
  OrganisationUserData organisation;

  int _radioValue = -1;

  _DonorOragnisationBookingState(this.organisation);

  DonationsController donationsController = new DonationsController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 130,
              ),
              Text(
                'Select date and time for donation',
                style: TextStyle(
                    fontSize: 20,
                    color: kLightGrey,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2020, 1, 1),
                          maxTime: DateTime(2040, 12, 31), onChanged: (date) {
                        date = date;
                        print(date);
                      }, onConfirm: (date) {
                        date = date;
                        print(date);
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 50,
                      height: 60,
                      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kGreenTextColor,
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text('Pick a date',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                ],
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio(
                        value: 0,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      new Text(
                        'Breakfast(8.00 - 9.00)',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio(
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      new Text(
                        'Lunch(12.00 - 13.00)',
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio(
                        value: 2,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      new Text(
                        'Dinner(20.00 -21.00)',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio(
                        value: 23,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      new Text(
                        'Other',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                    style: TextStyle(
                      fontSize: 20.0,
                      color: kDarkGrey,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Input Ingredients in Meal',
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black26,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kLightGrey, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kLightGrey, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusColor: kLightGrey,
                    ),
                    onChanged: (value) {
                      ingredients = value;
                    }),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                child: TextField(
                    style: TextStyle(
                      fontSize: 20.0,
                      color: kDarkGrey,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Input Calories in Meal per Person',
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black26,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kLightGrey, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kLightGrey, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusColor: kLightGrey,
                    ),
                    onChanged: (value) {
                      calories = value;
                    }),
              ),
              GestureDetector(
                onTap: () async {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text('Do you confirm your donation?'),
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
                                  setDataAndChangeScreen();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DonorHome()));
                                },
                              )
                            ],
                          ));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 60,
                  margin: EdgeInsets.symmetric(vertical: 35, horizontal: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kGreenTextColor,
                  ),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text('Confirm Donation',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          time = "8.00 - 9.00";
          print(value);
          break;
        case 1:
          time = "12.00 - 13.00";
          print(value);
          break;
        case 2:
          time = "20.00 - 21.00";
          print(value);
          break;
        case 3:
          time = "Other";
          print(value);
          break;
      }
    });
  }

  Future<void> setDataAndChangeScreen() async {
    final prefs = await SharedPreferences.getInstance();
    final String uid = prefs.getString('uid') ?? 0;
    donationsController.enterDonation(
        uid, organisation.uid, date.toString(), time, ingredients, calories);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DonorHome()));
  }
}
