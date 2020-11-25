import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 50) {
      resultText =
          'আপনার করোনা সংক্রামন হওয়ার সম্ভবনা খুব কম ।   Result: Your chances of getting a corona infection are very low';
    } else if (resultScore <= 65) {
      resultText =
          'আপনার করোনা সংক্রামন  হওয়ার সম্ভবনা খুব বেশি না তবে অবশ্যাই ৪৮ ঘন্টা পর্যবেক্ষণ এ থাকবেন। Result: Your coronary heart disease is not very likely to be, but of course, 48 hours of observation';
    } else if (resultScore <= 74) {
      resultText =
          'আপনার করোনা সংক্রামন হওয়ার সম্ভবনা খুব বেশি,অতি শীগ্রই ডাক্তার এর চিকিৎসা নিন । Result: Your chances of getting a corona infection are very high, seek medical attention immediately.';
    } else {
      resultText =
          'আপনার করোনা সংক্রামন হওয়ার সম্ভবনা খুব বেশি,অতি শীগ্রই ডাক্তার এর চিকিৎসা নিন ।  Result: আপনার করোনা সংক্রামন হওয়ার সম্ভবনা খুব বেশি,অতি শীগ্রই ডাক্তার এর চিকিৎসা নিন । ';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.red[400],
            child: Text(
              resultPhrase,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30),
          Container(
            color: Colors.black26,
            alignment: Alignment.bottomCenter,
            child: Text(
                '"কোন অবস্থাতেই এই সফটওয়ার থেকে প্রাপ্ত ফলাফলকে অভিজ্ঞ ডাক্তার কর্তৃক স্বাস্থ্য পরামর্শ হিসেবে বিবেচনা করা যাবে না। বিস্তারিত জানতে ডাক্তার এর শরণাপন্ন হউন \'Make an appoinment\' Option এ।"',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                )),
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/images/corona_banner.jpeg',
            height: 200,
            width: 800,
          ),
          RaisedButton(
            padding: EdgeInsets.all(8),
            color: Colors.deepPurple,
            child: Text(
              'Start the test again',
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
