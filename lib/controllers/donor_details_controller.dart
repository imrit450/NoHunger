import 'package:appcup/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonorDetailsController {

  OrganisationUserData organisationUserData;

  Future<OrganisationUserData> getOrganisationDetails(String uid) async {
    var document = Firestore.instance.collection("organisation").document(uid).get();
    return await document.then((doc) {
      return OrganisationUserData(
        uid: doc.documentID,
        name: doc.data['name'] ?? '',
        contact_no: doc.data['contact_no'] ?? '',
        address: doc.data['address'] ?? '',
        email: doc.data['email'] ?? '' 
      );
    });
  }

}