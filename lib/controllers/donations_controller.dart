import 'package:appcup/models/donations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonationsController {
  final CollectionReference donationsCollection =
      Firestore.instance.collection('donations');

  Future enterDonation(String uid, String organisation_id, String date,
      String time, String ingredients, String calories) async {
    return await donationsCollection.document(uid).setData({
      'organisation_id': organisation_id,
      'date': date,
      'time': time,
      'ingredients': ingredients,
      'calories': calories,
    });
  }

  Donations getDonation(DocumentSnapshot snapshot) {
    return Donations(
      date: snapshot.data['date'],
      time: snapshot.data['time'],
      ingredients: snapshot.data['ingredients'],
    );
  }
}
