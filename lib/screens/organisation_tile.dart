import 'package:appcup/controllers/donor_details_controller.dart';
import 'package:appcup/models/user.dart';
import 'package:appcup/screens/donor_details.dart';
import 'package:flutter/material.dart';

class OrganisationTile extends StatelessWidget {

  OrganisationUserData organisation;
  OrganisationTile({ this.organisation });

  DonorDetailsController _donorDetailsController;

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
            child: Icon(Icons.account_balance, color: Colors.green,),
          ),
          title: Text(
            organisation.name,
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(organisation.address,
                        style: TextStyle(color: Colors.green))),
              )
            ],
          ),
          trailing:
          Icon(Icons.keyboard_arrow_right, color: Colors.green, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DonorDetails(organisation: organisation,)));
          },
        ),
      ),
    );
  }
}

