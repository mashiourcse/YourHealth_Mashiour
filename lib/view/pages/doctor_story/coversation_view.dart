import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yourhealth/data/models/doctor.dart';
import 'package:yourhealth/data/models/user.dart';
import 'package:yourhealth/view/pages/patient_story/chat_screen.dart';
import 'package:yourhealth/view/widgets/widgets.dart';

class ConversationPage extends StatefulWidget {
  final Doctor doctor;
  ConversationPage({this.doctor});
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  List<UserModel> users = List<UserModel>();

  bool _isDataLoaded = false;
  int newMessages;
  List<String> _conversationList = [
    'Patient 1',
    'Patient 2',
    'Patient 3',
    'Patient 4',
    'Patient 5',
    'Patient 6',
    'Patient 7',
    'Patient 8',
    'Patient 9',
    'Patient 10',
    'Patient 11',
  ];
  bool isOnline = false;

  @override
  void initState() {
    super.initState();
    _getPatientList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Conversations'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UserAvatar(),
                Flexible(
                  child: Text(
                    widget.doctor.name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Switch(
                      value: isOnline,
                      onChanged: (value) {
                        setState(() {
                          isOnline = value;
                        });
                      },
                      activeColor: Colors.green,
                      activeTrackColor: Colors.lightGreenAccent,
                    ),
                    Container(
                      color: Colors.grey,
                      alignment: Alignment.center,
                      child: Text(isOnline ? 'Online' : 'Offline'),
                    ),
                  ],
                ),
              ],
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
                                  _getPatientList();
                                }));
                          },
                          title: Text(users[index].name),
                          trailing: users[index].newMessage != 0
                              ? Container(
                                  padding: EdgeInsets.all(7.0),
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

  Future<void> _getPatientList() async {
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
