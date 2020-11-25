import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yourhealth/data/models/user.dart';

class ChatScreenAppBar extends StatefulWidget implements PreferredSizeWidget {
  final UserModel user;
  ChatScreenAppBar({this.user});

  @override
  _ChatScreenAppBarState createState() => _ChatScreenAppBarState();
  @override
  Size get preferredSize => Size.fromHeight(100);
}

class _ChatScreenAppBarState extends State<ChatScreenAppBar> {
  String _imageUrl;
  bool _isImageLoaded = false;

  @override
  void initState() {
    super.initState();
    _getProfileImage();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
              color: Colors.black,
              blurRadius: 5.0,
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.centerLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.blue, size: 40),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      widget.user.name,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Text(
                    'Online',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
        Flexible(
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.blueAccent,
                child: ClipOval(
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
             )
              // Icon(
              //   Icons.person_outline_rounded,
              //   color: Colors.indigo,
              //   size: 50,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  _getProfileImage() async {
    String uid = widget.user.uid;
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    //String url;
    setState(() {
      _imageUrl = snapshot.data()['image'];
    });
  }
}
