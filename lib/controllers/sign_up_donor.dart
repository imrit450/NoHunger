import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class SignUpDonorController {

  final String uid;
  SignUpDonorController({ this.uid });

  final CollectionReference donorCollection = Firestore.instance.collection('brews');

  Future<void> enterDonorData(String name, String contact_no, String email, String address) async {
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
      uid: uid,
      name: snapshot.data['name'],
      contact_no: snapshot.data['contact_no'],
      email: snapshot.data['email'],
      address: snapshot.data['address']
    );
  }

}