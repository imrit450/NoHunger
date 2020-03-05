import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

import '../models/user.dart';

class SignUpOrganisationController {

  final String uid;
  SignUpOrganisationController({ this.uid });

  final CollectionReference organisationCollection = Firestore.instance.collection('organisation');
  StorageReference pdfStorage = FirebaseStorage.instance.ref().child('pdfUpload');

  String fileType = '';
  File file;
  String fileName = '';
  String operationText = '';
  bool isUploaded = true;
  String result = '';

  Future<void> enterOrganisationData(String name, String contact_no, String email, String address, String brn_no, String dietary_rules, String days_accept, String category) async {
    return await organisationCollection.document(uid).setData({
      'name': name,
      'contact_no': contact_no,
      'email': email,
      'address': address,
      'brn_no': brn_no,
      'dietary_rules': dietary_rules,
      'days_accept': days_accept,
      'category': category,
    });
  }

  // add into dispay organisation data screen
  OrganisationUserData getOrganisationData(DocumentSnapshot snapshot) {
    return OrganisationUserData(
      uid: uid,
      name: snapshot.data['name'],
      contact_no: snapshot.data['contact_no'],
      email: snapshot.data['email'],
      address: snapshot.data['address'],
      brn_no: snapshot.data['brn_no'],
      dietary_rules: snapshot.data['address'],
      days_accept: snapshot.data['days_accept']
    );
  }

  
 
  // //File Picker to Database
  // Future<void> uploadPDFFile(File file, String fileName) async {
  //     pdfStorage = FirebaseStorage.instance.ref().child("$uid/$fileName");
  //     final StorageUploadTask uploadTask = pdfStorage.putFile(file);
  //     final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
  //     final String url = (await downloadUrl.ref.getDownloadURL());
  //     print("URL of PDF is $url");
  // }

  // //File Picker
  // Future choosePDFFile(BuildContext context) async {
  //   try {
  //     file = await FilePicker.getFile(type: FileType.ANY);
  //     fileName = p.basename(file.path);
  //     setState(() {
  //       fileName = p.basename(file.path);
  //     });
  //     print(fileName);
  //     uploadPDFFile(file, fileName);
  //   } on PlatformException catch (e) {
  //       showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             title: Text('Sorry...'),
  //             content: Text('Unsupported exception: $e'),
  //             actions: <Widget>[
  //               FlatButton(
  //                 child: Text('OK'),
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //               )
  //             ],
  //           );
  //         }
  //       );
  //     }
  //   }
  // }
}