import 'package:appcup/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonorHomeController {

  final CollectionReference organisationCollection = Firestore.instance.collection('organisation');

  List<OrganisationUserData> oraganisationListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return OrganisationUserData(
        uid: doc.documentID,
        name: doc.data['name'] ?? '',
        contact_no: doc.data['contact_no'] ?? '',
        address: doc.data['address'] ?? '',
        email: doc.data['email'] ?? '' 
      );
    }).toList();
  }

  Stream<List<OrganisationUserData>> get organisations {
    return organisationCollection.snapshots()
      .map(oraganisationListFromSnapshot);
  }

}