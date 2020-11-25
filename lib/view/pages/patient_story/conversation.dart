import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yourhealth/data/models/user.dart';
import 'package:yourhealth/view/pages/patient_story/chat_screen.dart';
import 'package:yourhealth/view/pages/patient_story/chat_with_doctor.dart';
import 'package:yourhealth/view/pages/patient_story/patient_home.dart';

import '../../widgets/widgets.dart';

class PatientConversationPage extends StatefulWidget {
  @override
  _PatientConversationPageState createState() =>
      _PatientConversationPageState();
}

class _PatientConversationPageState extends State<PatientConversationPage> {
  List<UserModel> users = List<UserModel>();
  bool _isDataLoaded = false;
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    _getDoctorList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Conversations'),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),
            Text(
              'Recent conversations',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30),
            Flexible(
              child: !_isDataLoaded
                  ? Center(child: CircularProgressIndicator())
                  : ListView(
                      scrollDirection: Axis.vertical,
                      children: List.generate(
                        users.length,
                        (index) => ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatScreen(
                                          receiver: users[index],
                                        ))).then((value) => setState(() {
                                  _isDataLoaded = false;
                                  users.clear();
                                  _getDoctorList();
                                }));
                          },
                          title: Text(users[index].name),
                          trailing: users[index].newMessage != 0
                              ? Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    users[index].newMessage.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                  ),
                                )
                              : SizedBox(),
                          leading: Icon(Icons.person_outline_rounded),
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PatientHome()));
          break;
        }
      case 1:
        {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PatientConversationPage()));
          break;
        }
      case 2:
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PatientHome()));
          break;
        }
      case 3:
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PatientHome()));
          break;
        }
      default:
    }
  }

  Future<void> _getDoctorList() async {
    String currentUid = await FirebaseAuth.instance.currentUser.uid;
    final fireStore = FirebaseFirestore.instance;
    print('Firebase');
    QuerySnapshot query = await fireStore
        .collection('users')
        .doc(currentUid)
        .collection('conversations')
        .orderBy('timeStamp', descending: true)
        .get();
    var docs = query.docs;

    for (int i = 0; i < docs.length; i++) {
      int messageCount = docs[i].data()['messageCount'];
      DocumentSnapshot result =
          await fireStore.collection('users').doc(docs[i].id).get();
      String name = result.data()['name'];
      String uid = docs[i].id;
      users.add(UserModel(name: name, uid: uid, newMessage: messageCount));
    }

    setState(() => _isDataLoaded = true);
  }
}
