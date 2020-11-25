import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yourhealth/data/models/doctor.dart';
import 'package:yourhealth/data/models/user.dart';
import 'package:yourhealth/data/services/auth_services.dart';
import 'package:yourhealth/view/pages/patient_story/chat_screen.dart';

import '../../widgets/widgets.dart';

class ChatWithPatient extends StatefulWidget {
  @override
  _ChatWithPatientState createState() => _ChatWithPatientState();
}

class _ChatWithPatientState extends State<ChatWithPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Doctors'),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Header(),
          SizedBox(height: 40),
          Text(
            'Select patient from the list below and get started immediately',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 30),
          Flexible(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('doctors')
                    .doc(FirebaseAuth.instance.currentUser.uid)
                    .collection('appointments')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Colors.blue,
                    ));
                  }
                  // for (var doc in snapshot.data) {
                  //   print(doc.name);
                  //   print(doc.uid);
                  //   print(doc.speciality);
                  // }
                  return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        UserModel patient = UserModel(
                          name:
                              snapshot.data.docs[index].data()['patientName'] ??
                                  '',
                          uid: snapshot.data.docs[index].data()['patientId'] ??
                              '',
                        );
                        return Card(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: ListTile(
                              leading: Icon(
                                Icons.person,
                                size: 40,
                              ),
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    patient.name,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              onTap: () {
                                _listTileTapped(context, patient);
                              },
                            ),
                          ),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }

  _listTileTapped(BuildContext context, UserModel patient) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ChatScreen(receiver: patient)));
  }
}
