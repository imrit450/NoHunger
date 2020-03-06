import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class SignUpDonorController {
  final CollectionReference donorCollection =
      Firestore.instance.collection('donor');

  Future enterDonorData(
      String name, String contact_no, String email, String address) async {
    final prefs = await SharedPreferences.getInstance();
    final String uid = prefs.getString('uid') ?? null;
    return await donorCollection.document(uid).setData({
      'name': name,
      'contact_no': contact_no,
      'email': email,
      'address': address,
      'donations': 0,
    });
  }

  // add into dispay donor data screen
  DonorUserData getDonorData(DocumentSnapshot snapshot) {
    return DonorUserData(
        uid: snapshot.documentID,
        name: snapshot.data['name'],
        contact_no: snapshot.data['contact_no'],
        email: snapshot.data['email'],
        address: snapshot.data['address']);
  }
}
