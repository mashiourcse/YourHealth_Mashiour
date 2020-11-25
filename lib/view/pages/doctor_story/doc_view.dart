import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yourhealth/Product/screens/products_overview_screen.dart';
import 'package:yourhealth/data/models/doctor.dart';
import 'package:yourhealth/view/pages/doctor_story/appointments.dart';
import 'package:yourhealth/view/pages/doctor_story/awaiting_verification_from_admin.dart';
import 'package:yourhealth/view/pages/doctor_story/chat_with_patient.dart';
import 'package:yourhealth/view/pages/doctor_story/coversation_view.dart';
import 'package:yourhealth/view/pages/doctor_story/doctor_appointment_requests.dart';
import 'package:yourhealth/view/pages/doctor_story/doctor_profile.dart';
import 'package:yourhealth/view/widgets/widgets.dart';

class DocView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('doctors')
            .doc(FirebaseAuth.instance.currentUser.uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();

          bool isVerified = snapshot.data.data()['isVerified'] ?? false;

          if (!isVerified) {
            return AwaitingVerification();
          }

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Doctor'),
              actions: [
                IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DoctorProfilePage()));
                    })
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //Header(),
                    const SizedBox(height: 40),
                    //UserAvatar(),
                    Image.asset(
                      'assets/images/apoinment.jpg',
                      height: 60,
                    ),
                    const SizedBox(height: 10),
                    // Text(
                    //   "Doctor",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 30),
                    // ),
                    const SizedBox(height: 30),
                    RoundedButton(
                      label: 'Appointment Requests',
                      bgColor: Colors.deepPurple,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DoctorAppointmentRequests()));
                      },
                    ),
                    const SizedBox(height: 10),

                    RoundedButton(
                      label: 'Appointments',
                      bgColor: Colors.deepPurple,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AppointmentPage()));
                      },
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'assets/images/chatwithdoctor.PNG', //apoinment
                      height: 80,
                    ),

                    RoundedButton(
                      label: 'Chat With Appointed Patients',
                      bgColor: Colors.deepPurple,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatWithPatient()));
                      },
                    ),
                    const SizedBox(height: 10),
                    RoundedButton(
                      label: 'Conversations',
                      bgColor: Colors.deepPurple,
                      onPressed: () {
                        _conversationButtonPressed(context);
                      },
                    ),
                    const SizedBox(height: 30),

                    Image.asset(
                      'assets/images/healthproduct.png',
                      height: 60,
                    ),

                    RoundedButton(
                      label: 'Buy Health Products',
                      bgColor: Colors.deepPurple,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductsOverviewScreen()));
                      },
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _conversationButtonPressed(BuildContext context) async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    DocumentSnapshot document =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    Doctor doctor = Doctor(
        name: document.data()['name'],
        uid: document.data()['uid'],
        speciality: document.data()['speciality']);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ConversationPage(
                  doctor: doctor,
                )));
  }
}
