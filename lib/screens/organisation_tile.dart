import 'package:appcup/controllers/donor_details_controller.dart';
import 'package:appcup/models/user.dart';
import 'package:appcup/screens/donor_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrganisationTile extends StatelessWidget {
  OrganisationUserData organisation;
  OrganisationTile({this.organisation});

  DonorDetailsController _donorDetailsController;

  Map<String, IconData> categoryIcon = {
    'Animal Charities': (FontAwesomeIcons.paw),
    'Environmental Charities': (FontAwesomeIcons.leaf),
    'International NGOs': (FontAwesomeIcons.globe),
    'Health Charities': (Icons.mobile_screen_share),
    'Education Charities': (FontAwesomeIcons.graduationCap),
    'Arts & Culture Charties': (FontAwesomeIcons.paintBrush),
    'Distribution': (FontAwesomeIcons.handshake),
    'Orphanage': (FontAwesomeIcons.babyCarriage),
    'Home': (FontAwesomeIcons.home),
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Icon(
              categoryIcon[organisation.category],
              color: Colors.black,
            ),
          ),
          title: Column(
            children: <Widget>[
              Text(
                organisation.name,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Column(
            children: <Widget>[
              Text(organisation.address, style: TextStyle(color: Colors.black)),
              Row(
                children: <Widget>[
                  Chip(label: Text(organisation.category)),
                  SizedBox(
                    width: 5,
                  ),
                  Chip(label: Text(organisation.days_accept)),
                ],
              ),
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DonorDetails(
                          organisation: organisation,
                        )));
          },
        ),
      ),
    );
  }
}
