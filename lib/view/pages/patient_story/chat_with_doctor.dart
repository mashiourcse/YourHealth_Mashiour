import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yourhealth/data/models/doctor.dart';
import 'package:yourhealth/data/models/user.dart';
import 'package:yourhealth/data/services/auth_services.dart';
import 'package:yourhealth/view/pages/patient_story/chat_screen.dart';

import '../../widgets/widgets.dart';

class ChatWithDoctor extends StatefulWidget {
  @override
  _ChatWithDoctorState createState() => _ChatWithDoctorState();
}

class _ChatWithDoctorState extends State<ChatWithDoctor> {
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
          SizedBox(height: 40),
          Image.asset(
            'assets/images/consulataion.PNG',
            height: 125,

          ),
          Text(
            'Select doctor from the list below and get consultation started immediately',
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
                    .collection('patients')
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
                        UserModel doctor = UserModel(
                          name:
                              snapshot.data.docs[index].data()['doctorName'] ??
                                  '',
                          uid: snapshot.data.docs[index].data()['doctorId'] ??
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
                                    doctor.name,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              onTap: () {
                                _listTileTapped(context, doctor);
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

  _listTileTapped(BuildContext context, UserModel doctor) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ChatScreen(receiver: doctor)));
  }
}
