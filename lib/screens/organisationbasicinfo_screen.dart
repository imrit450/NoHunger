import 'dart:io';

import 'package:appcup/components/inputfieldyellow.dart';
import 'package:appcup/components/large_btn.dart';
import 'package:appcup/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appcup/screens/orglogindetails_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

class OrganisationBasicInfo extends StatefulWidget {
  final String userSelected;
  OrganisationBasicInfo({Key key, @required this.userSelected})
      : super(key: key);
  @override
  _OrganisationBasicInfo createState() => _OrganisationBasicInfo(userSelected);
}

class _OrganisationBasicInfo extends State<OrganisationBasicInfo> {
  String _fileName;
  String _path;
  Map<String, String> _paths;
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  bool _hasValidMime = false;
  FileType _pickingType;
  TextEditingController _controller = new TextEditingController();
  String userSelected;

  _OrganisationBasicInfo(this.userSelected);

  String name;
  String address;
  String phoneNum;
  Category selectedCategory;
  String brn;

  String fileType = '';
  File file;
  String fileName = '';
  String operationText = '';
  bool isUploaded = true;
  String result = '';

  List<Category> users = <Category>[
    const Category(
        'Animal Charities',
        Icon(
          FontAwesomeIcons.paw,
          color: kYellowTextColor,
        )),
    const Category(
        'Environmental Charities',
        Icon(
          FontAwesomeIcons.leaf,
          color: kYellowTextColor,
        )),
    const Category(
        'International NGOs',
        Icon(
          FontAwesomeIcons.globe,
          color: kYellowTextColor,
        )),
    const Category(
        'Health Charities',
        Icon(
          FontAwesomeIcons.heartbeat,
          color: kYellowTextColor,
        )),
    const Category(
        'Education Charities',
        Icon(
          FontAwesomeIcons.graduationCap,
          color: kYellowTextColor,
        )),
    const Category(
        'Arts & Culture Charties',
        Icon(
          FontAwesomeIcons.paintBrush,
          color: kYellowTextColor,
        )),
    const Category(
        'Distribution',
        Icon(
          FontAwesomeIcons.handshake,
          color: kYellowTextColor,
        )),
    const Category(
        'Orphanage',
        Icon(
          FontAwesomeIcons.babyCarriage,
          color: kYellowTextColor,
        )),
    const Category(
        'Home',
        Icon(
          FontAwesomeIcons.home,
          color: kYellowTextColor,
        )),
  ];

  final globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  Future<void> _openFileExplorer() async {
    if (_pickingType != FileType.CUSTOM || _hasValidMime) {
      setState(() => _loadingPath = true);
      try {
        if (_multiPick) {
          _path = null;
          _paths = await FilePicker.getMultiFilePath(
              type: _pickingType, fileExtension: _extension);
        } else {
          _paths = null;
          _path = await FilePicker.getFilePath(
              type: _pickingType, fileExtension: _extension);
        }
      } catch (e) {
        print("Unsupported operation" + e.toString());
      }
      if (!mounted) return;
      setState(() {
        _loadingPath = false;
        _fileName = _path != null
            ? _path.split('/').last
            : _paths != null ? _paths.keys.toString() : '...';
      });
    }
    file = await FilePicker.getFile(type: FileType.ANY);
    fileName = p.basename(file.path);
    setState(() {
      fileName = p.basename(file.path);
    });
    print(fileName);
  }

  Future<void> picker() async {
    file = await ImagePicker.pickImage(source: ImageSource.camera);
    fileName = p.basename(file.path);
    setState(() {
      fileName = p.basename(file.path);
    });
    print(fileName);
  }

  Future<void> _uploadFile(File file, String filename) async {
    StorageReference storageReference;
    storageReference =
        FirebaseStorage.instance.ref().child("certificates/$filename");
    final StorageUploadTask uploadTask = storageReference.putFile(file);
    final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
    final String url = (await downloadUrl.ref.getDownloadURL());
    print("URL is $url");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset('assets/images/welcomeimage.jfif'),
                Positioned.fill(
                  top: 220,
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Let\'s make a difference by ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              TextSpan(
                                text: 'donating',
                                style: TextStyle(
                                    shadows: shadows,
                                    fontWeight: FontWeight.bold,
                                    color: kYellowTextColor),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Let\'s start by entering your\norganisation details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            InputFieldYellow(
              textPlaceholder: 'Name',
              iconName: 'yUserIcon.png',
              textType: TextInputType.text,
              onChanged: (value) {
                name = value;
              },
            ),
            InputFieldYellow(
              textPlaceholder: 'Address',
              iconName: 'yAddressIcon.png',
              textType: TextInputType.text,
              onChanged: (value) {
                address = value;
              },
            ),
            InputFieldYellow(
              textPlaceholder: 'Phone Number',
              iconName: 'yPhoneIcon.png',
              textType: TextInputType.phone,
              onChanged: (value) {
                phoneNum = value;
              },
            ),
            InputFieldYellow(
              textPlaceholder: 'Business Registration Number',
              iconName: 'brnicon.png',
              textType: TextInputType.number,
              onChanged: (value) {
                brn = value;
              },
            ),
            DropdownButton<Category>(
              hint: Text("Select Category"),
              value: selectedCategory,
              onChanged: (Category Value) {
                setState(() {
                  selectedCategory = Value;
                });
              },
              items: users.map((Category user) {
                return DropdownMenuItem<Category>(
                  value: user,
                  child: Row(
                    children: <Widget>[
                      user.icon,
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        user.category,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: kYellowTextColor.withOpacity(0.7)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Upload your Certificate',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(FontAwesomeIcons.arrowDown),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                  ),
                  new ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 100.0),
                    child: _pickingType == FileType.CUSTOM
                        ? new TextFormField(
                            maxLength: 15,
                            autovalidate: true,
                            controller: _controller,
                            decoration:
                                InputDecoration(labelText: 'File extension'),
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.none,
                            validator: (value) {
                              RegExp reg = new RegExp(r'[^a-zA-Z0-9]');
                              if (reg.hasMatch(value)) {
                                _hasValidMime = false;
                                return 'Invalid format';
                              }
                              _hasValidMime = true;
                              return null;
                            },
                          )
                        : new Container(),
                  ),
                  FloatingActionButton(
                    child: Icon(FontAwesomeIcons.camera),
                    backgroundColor: Colors.grey,
                    onPressed: () {
                      picker();
                    },
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: new RaisedButton(
                      onPressed: () => _openFileExplorer(),
                      child: new Text("Open File Picker"),
                    ),
                  ),
                  new Builder(
                    builder: (BuildContext context) => _loadingPath
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: const CircularProgressIndicator())
                        : _path != null || _paths != null
                            ? new Container(
                                padding: const EdgeInsets.only(bottom: 30.0),
                                height: 100,
                                child: new Scrollbar(
                                    child: new ListView.separated(
                                  itemCount: _paths != null && _paths.isNotEmpty
                                      ? _paths.length
                                      : 1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final bool isMultiPath =
                                        _paths != null && _paths.isNotEmpty;
                                    final String name = 'File $index: ' +
                                        (isMultiPath
                                            ? _paths.keys.toList()[index]
                                            : _fileName ?? '...');
                                    final path = isMultiPath
                                        ? _paths.values
                                            .toList()[index]
                                            .toString()
                                        : _path;

                                    return new ListTile(
                                      title: new Text(
                                        name,
                                      ),
                                      subtitle: new Text(path),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          new Divider(),
                                )),
                              )
                            : new Container(),
                  ),
                ],
              ),
            ),
            Hero(
              tag: 'bottombtn',
              child: LargeButton(
                myText: 'Next',
                startColor: kYellowDarkerColor,
                endColor: kYellowTextColor,
                onPressed: () {
                  try {
                    _uploadFile(file, fileName);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrgLoginDetailsScreen(
                                  userSelected: userSelected,
                                  name: name,
                                  address: address,
                                  phoneNum: phoneNum,
                                  brn: brn,
                                  selectedCategory: selectedCategory.category,
                                )));
                  } catch (e) {
                    print(e);
                    Navigator.pushNamed(context, '/basicinfo_screen');
                  }
                  print(name);
                  print(address);
                  print(phoneNum);
                  print(brn);
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class Category {
  const Category(this.category, this.icon);
  final String category;
  final Icon icon;
}
