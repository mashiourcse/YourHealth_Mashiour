import 'package:flutter/material.dart';

class ChatItemWidget extends StatelessWidget {
  final String text;
  final String receiver;
  final String id;
  final String timeStamp;

  ChatItemWidget({this.text, this.receiver, this.id, this.timeStamp});

  @override
  Widget build(BuildContext context) {
    if (receiver == id) {
      //This is the sent message. We'll later use data from firebase instead of index to determine the message is sent or received.
      return Container(
          child: Column(children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              child: Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
              width: 200.0,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(8.0)),
              margin:
                  EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0, right: 5.0),
            )
          ],
          mainAxisAlignment:
              MainAxisAlignment.end, // aligns the chatitem to right end
        ),
        // Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        //   Container(
        //     child: Text(
        //       timeStamp.toString(),
        //       style: TextStyle(
        //           color: Colors.black,
        //           fontSize: 12.0,
        //           fontStyle: FontStyle.normal),
        //     ),
        //     margin: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
        //   )
        // ])
      ]));
    } else {
      // This is a received message
      return Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.white),
                  ),
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  width: 200.0,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8.0)),
                  margin: EdgeInsets.only(left: 10.0),
                )
              ],
            ),
            // Container(
            //   child: Text(
            //     timeStamp.toString(),
            //     style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 12.0,
            //         fontStyle: FontStyle.normal),
            //   ),
            //   margin: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
            // )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        margin: EdgeInsets.only(bottom: 10.0),
      );
    }
  }
}
