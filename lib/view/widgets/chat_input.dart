import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatInputWidget extends StatelessWidget {
  final String receiver;
  String _message = '';
  ChatInputWidget({this.receiver});

  final TextEditingController textEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          // Material(
          //   child: new Container(
          //     margin: new EdgeInsets.symmetric(horizontal: 1.0),
          //     child: new IconButton(
          //       onPressed: () {},
          //       icon: new Icon(Icons.face),
          //       color: Colors.teal,
          //     ),
          //   ),
          //   color: Colors.white,
          // ),

          // Text input
          Flexible(
            child: Container(
              child: TextField(
                onChanged: (value) {
                  _message = value;
                  //print(_message);
                },
                style: TextStyle(color: Colors.black, fontSize: 15.0),
                controller: textEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type a message',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),

          // Send Message Button
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 8.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: _sendButtonPressed,
                color: Colors.teal,
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: new BoxDecoration(
          border:
              new Border(top: new BorderSide(color: Colors.grey, width: 0.5)),
          color: Colors.white),
    );
  }

  Future<void> _sendButtonPressed() async {
    String senderId = FirebaseAuth.instance.currentUser.uid;
    String receiverId = receiver;
    String messageBody = _message;
    FieldValue time = FieldValue.serverTimestamp();
    int messageCount;
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('conversations')
        .doc(senderId)
        .get()
        .then((value) {
      if (value.exists) {
        messageCount = value.data()['messageCount'];
      } else {
        messageCount = 0;
      }
    });

    print(messageCount);

    await FirebaseFirestore.instance
        .collection('users')
        .doc(senderId)
        .collection('conversations')
        .doc(receiverId)
        .set({'messageCount': 0, 'timeStamp': time});

    await FirebaseFirestore.instance
        .collection('users')
        .doc(senderId)
        .collection('conversations')
        .doc(receiverId)
        .collection('messages')
        .doc()
        .set({
      'body': _message,
      'senderId': senderId,
      'receiverId': receiverId,
      'timeStamp': time
    });

    await FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('conversations')
        .doc(senderId)
        .set({'messageCount': (messageCount += 1), 'timeStamp': time});
    await FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('conversations')
        .doc(senderId)
        .collection('messages')
        .doc()
        .set({
      'body': _message,
      'senderId': senderId,
      'receiverId': receiverId,
      'timeStamp': time
    });
    textEditingController.clear();
  }
}
