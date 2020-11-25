import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 12) {
      resultText = 'Result: Probably You are not affected with Dengu.';
    } else if (resultScore <= 15) {
      resultText =
          'Result: You have probably minor chances of affected with Dengu.   ';
    } else {
      resultText =
          'Result: You are probably affected with Dengu , try to consult with doctor as soon as possible .';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Text(
              resultPhrase,
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30),
          Container(
            color: Colors.black12,
            alignment: Alignment.bottomCenter,
            child: Text(
                'The results obtained from this software can not be considered as health advice from an experienced doctor. For further consultation make an apoinment and chat with the Doctor.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                )),
          ),
          Image.asset(
            'assets/images/dengu.jpg',
            height: 400,
          ),
          RaisedButton(
            padding: EdgeInsets.all(8),
            color: Colors.blue,
            child: Text(
              'Start the test again!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            textColor: Colors.blue,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
