import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yourhealth/view/pages/auth_dashboard.dart';
import 'package:yourhealth/view/pages/doctor_story/doc_view.dart';
import 'package:yourhealth/view/pages/patient_story/patient_home.dart';

class LoadingScreen extends StatefulWidget {
  final User user;

  LoadingScreen({this.user});
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool isLoaded = false;
  String _role = '';

  @override
  void initState() {
    _getRole();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : (_role == 'NOT_FOUND')
            ? AuthDashboardPage()
            : (_role == 'patient')
                ? PatientHome()
                : DocView();
  }

  Future<void> _getRole() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.user.uid)
        .get();
    if (snapshot != null) {
      Map<String, dynamic> data = snapshot.data();
      try {
        _role = data['role'];
      } catch (e) {
        _role = 'NOT_FOUND';
      }
      print(widget.user.uid);
      print(_role);
      setState(() {
        isLoaded = true;
      });
    }
  }
}
