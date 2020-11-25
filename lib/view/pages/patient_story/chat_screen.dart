import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yourhealth/data/models/user.dart';

import '../../widgets/widgets.dart';

class ChatScreen extends StatefulWidget {
  final UserModel receiver;

  ChatScreen({this.receiver});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController listScrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _clearMessageCount();
  }

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: ChatScreenAppBar(user: widget.receiver),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(_auth.currentUser.uid)
                    .collection('conversations')
                    .doc(widget.receiver.uid)
                    .collection('messages')
                    .orderBy('timeStamp', descending: true)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    print('no messages');
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      reverse: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        return ChatItemWidget(
                          text: snapshot.data.docs[index]['body'],
                          receiver: snapshot.data.docs[index]['receiverId'],
                          id: widget.receiver.uid,
                          // timeStamp: snapshot.data.docs[index]['timeStamp']
                          //     .toDate()
                          //     .toString(),
                        );
                        // return Container(
                        //     child: Text(snapshot.data.docs[index]['body']));
                      });
                },
              ),
            ),
            ChatInputWidget(receiver: widget.receiver.uid), //for input
          ],
        ),
      ),
    );
  }

  Future<void> _clearMessageCount() async {
    String senderId = FirebaseAuth.instance.currentUser.uid;
    String receiverId = widget.receiver.uid;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(senderId)
        .collection('conversations')
        .doc(receiverId)
        .set({'messageCount': 0}, SetOptions(merge: true));
  }
}
