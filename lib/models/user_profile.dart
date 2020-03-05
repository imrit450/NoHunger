import 'package:flutter/material.dart';
import 'user.dart';

class UserProfile extends StatefulWidget {

  final DonorUserData user;

  UserProfile({Key key, @required this.user});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


List getUsers(){
  return [
    DonorUserData(
      uid: 'sowoeo',
      name: 'Ismail',
      contact_no: '59038907',
      email: 'imrit450@gmail.com',
      address: 'ROyal ROad Notre Dame',
    ),
  ];
}
