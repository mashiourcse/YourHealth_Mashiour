import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:yourhealth/data/services/auth_services.dart';
import 'package:yourhealth/view/pages/auth_dashboard.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File _image;
  bool _imageSelected = false;
  bool _dataLoaded = false;
  String _imageUrl;
  Map<String, dynamic> _profileData;

  @override
  void initState() {
    super.initState();
    _getProfileImage();
    _getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: !_dataLoaded
              ? Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.blueAccent,
                          child: ClipOval(
                            child: SizedBox(
                              height: 180,
                              width: 180,
                              child: _imageUrl != null
                                  ? Image.network(
                                      _imageUrl,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.network(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSKsmTSO8AUBRn1D-9hiSMles-PJRO9Ci5_5w&usqp=CAU',
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 60),
                          child: IconButton(
                            icon: Icon(
                              Icons.photo,
                              size: 50,
                            ),
                            onPressed: () {
                              _pickImage();
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                            color: Colors.blue,
                            child: Text(
                              'Upload',
                              style: TextStyle(
                                  color: !_imageSelected
                                      ? Colors.black
                                      : Colors.white),
                            ),
                            onPressed: _imageSelected == false
                                ? null
                                : () {
                                    _uploadImage();
                                  }),
                        SizedBox(width: 10),
                        Text(_imageSelected ? basename(_image.path) : ''),
                      ],
                    ),
                    SizedBox(width: 30),
                    InfoWidget(
                      fieldName: 'Name',
                      fieldData: _profileData['name'] ?? '',
                    ),
                    InfoWidget(
                      fieldName: 'Age',
                      fieldData: _profileData['age'] ?? '',
                    ),
                    InfoWidget(
                      fieldName: 'Gender',
                      fieldData: _profileData['gender'] ?? '',
                    ),
                    InfoWidget(
                      fieldName: 'Blood Group',
                      fieldData: _profileData['bloodGroup'] ?? '',
                    ),
                    InfoWidget(
                      fieldName: 'E-mail',
                      fieldData: _profileData['email'] ?? '',
                    ),
                    InfoWidget(
                      fieldName: 'Phone Number',
                      fieldData: _profileData['phoneNumber'] ?? '',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 80, right: 80, bottom: 10),
                      child: SizedBox(
                        height: 50,
                        child: RaisedButton(
                          elevation: 5,
                          color: Colors.white,
                          child: Text('Log Out'),
                          onPressed: () {
                            _logOutButtonPressed(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Future _pickImage() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    if (image != null) {
      _image = File(image.path);
      setState(() {
        _imageSelected = true;
      });
    } else {
      print('No Image Selected');
    }
  }

  Future _uploadImage() async {
    setState(() {
      _imageSelected = false;
    });
    print('Uploading');
    String uid = FirebaseAuth.instance.currentUser.uid;
    final StorageReference ref = FirebaseStorage.instance.ref().child(uid);
    StorageUploadTask task = ref.putFile(_image);
    StorageTaskSnapshot snapshot = await task.onComplete;

    var downloadUrl = await snapshot.ref.getDownloadURL();

    if (task.isComplete) {
      setState(() {
        _imageUrl = downloadUrl;
      });

      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set({'image': _imageUrl}, SetOptions(merge: true));
    }
  }

  _getProfileImage() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    //String url;
    setState(() {
      _imageUrl = snapshot.data()['image'];
    });
  }

  _getProfileData() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    _profileData = snapshot.data();
    print(_profileData);
    setState(() {
      _dataLoaded = true;
    });
  }

  void _logOutButtonPressed(BuildContext context) async {
    await AuthenticationService().signOutUser();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AuthDashboardPage()));
  }
}

class InfoWidget extends StatelessWidget {
  final String fieldName;
  final String fieldData;

  InfoWidget({this.fieldData, this.fieldName});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(fieldName,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(fieldData,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              )),
          Divider(),
        ],
      ),
    );
  }
}
