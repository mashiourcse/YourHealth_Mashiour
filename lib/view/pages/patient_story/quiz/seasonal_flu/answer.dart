import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: RaisedButton(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  answerText,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        color: Colors.blue,
        onPressed: selectHandler,
      ),
    );
  }
}
