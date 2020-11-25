import 'package:flutter/material.dart';
import 'package:yourhealth/view/pages/patient_story/quiz/quiz.dart';
import 'package:yourhealth/view/pages/patient_story/quiz/result.dart';

class QuizPage extends StatefulWidget {
  final String language;
  QuizPage({this.language});
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var _questionIndex = 0;
  List<Map<String, Object>> _questions;

  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.language == 'Bangla') {
      _questions = _questions = [
        {
          //1
          'questionText': '1.আপনার বয়স কত?',
          'answers': [
            {'text': 'a.0-20', 'score': 3},
            {'text': 'b.21-30', 'score': 2},
            {'text': 'c.31-40', 'score': 2},
            {'text': 'd.41-50', 'score': 3},
            {'text': 'e.51-65', 'score': 4},
            {'text': 'f.65+  ', 'score': 6},
          ]
        },
        {
          //2
          'questionText':
              '2.দয়াকরে আপনার শরীরের বর্তমান তাপমাত্রা কত তা আমাদের জানান।',
          'answers': [
            {
              'text': 'a.শরীরের তাপমাত্রা স্বাভাবিক আছে 96°F-98.6°F   ',
              'score': 2
            },
            {'text': 'b.জ্বর 98.6°F-102°F', 'score': 3},
            {'text': 'c.অনেক জ্বর >102°F', 'score': 5},
          ]
        },
        {
          //3
          'questionText': '3.আপনার কি শুকনা কাশি গলাব্যথা  লক্ষন রয়েছে?',
          'answers': [
            {'text': 'a.হ্যাঁ', 'score': 5},
            {'text': 'b.না', 'score': 2},
          ]
        },
        {
          //4
          'questionText': '4.আপনার কি  শ্বাসকষ্ট  লক্ষন রয়েছে?',
          'answers': [
            {'text': 'a.হ্যাঁ', 'score': 5},
            {'text': 'b.না', 'score': 2},
          ]
        },
        {
          //4
          'questionText':
              ' 5.আপনার কি অতি দুর্বলতা (যেমনঃ বাথরুমে যেতে অন্যের সাহায্যের প্রয়োজন হয় এমন) এবং সর্দি বা নাক দিয়ে পানি পড়ার লক্ষন রয়েছে?',
          'answers': [
            {'text': 'a.হ্যাঁ', 'score': 5},
            {'text': 'b.না', 'score': 2},
          ]
        },
        {
          //5
          'questionText': '6.আপনার কি পেট ব্যাথা লক্ষন দেখা দিয়েছে??',
          'answers': [
            {'text': 'a.হ্যাঁ', 'score': 5},
            {'text': 'b.না', 'score': 2},
          ]
        },
        {
          //6
          'questionText': '7.আপনার কি বমি বা পাতলা পায়খানা লক্ষন দেখা দিয়েছে?',
          'answers': [
            {'text': 'a.হ্যাঁ', 'score': 5},
            {'text': 'b.না', 'score': 2},
          ]
        },
        {
          //7
          'questionText':
              '8.আপনার কি বুকে ব্যথা এবং চাপ অনুভব করা লক্ষন দেখা দিয়েছে??',
          'answers': [
            {'text': 'a.হ্যাঁ', 'score': 5},
            {'text': 'b.না', 'score': 2},
          ]
        },
        {
          //8
          'questionText': '9.আপনার কি মাংশপেশি তে ব্যাথা অনুভব হয়?',
          'answers': [
            {'text': 'a.হ্যাঁ', 'score': 5},
            {'text': 'b.না', 'score': 2},
          ]
        },
        {
          //9
          'questionText':
              '10.আপনার কি নাকে গন্ধ না পাওয়া করা লক্ষন দেখা দিয়েছে?',
          'answers': [
            {'text': 'a.হ্যাঁ', 'score': 5},
            {'text': 'b.না', 'score': 2},
          ]
        },
        {
          //10
          'questionText':
              '11.আপনার কি চোখ চুলকানো বা লাল হয়ে যাওয়া লক্ষন দেখা দিয়েছে?',
          'answers': [
            {'text': 'a.হ্যাঁ', 'score': 5},
            {'text': 'b.না', 'score': 2},
          ]
        },
        {
          //11
          'questionText':
              '12.আপনার কি তন্দ্রাচ্ছন্নভাব(ঘুমে ব্যাঘাত) দেখা দিয়েছে?',
          'answers': [
            {'text': 'a.হ্যাঁ', 'score': 5},
            {'text': 'b.না', 'score': 2},
          ]
        },
        {
          //12
          'questionText': '13. আপনার কি এই রোগ গুলো আগে থেকেই আছে?',
          'answers': [
            {'text': 'a.ফুসফুসের সমস্যা', 'score': 2},
            {'text': 'b.হৃদরোগের সমস্যা', 'score': 2},
            {'text': 'c.উচ্চ রক্ত চাপ', 'score': 2},
            {'text': 'd.ডায়াবেটিস', 'score': 2},
            {'text': 'e.কিডনির সমস্যা', 'score': 2},
            {'text': 'f.ক্যান্সার', 'score': 2},
            {'text': 'g. আমার b এবং d অপশেন রোগ রয়েছে', 'score': 2},
            {'text': 'h.একটিও না', 'score': 2},
          ]
        },
        {
          //13
          'questionText': '14.আপনার কি ধূমপানের অভ্যাস আছে?',
          'answers': [
            {'text': 'a.হ্যাঁ', 'score': 5},
            {'text': 'b.না', 'score': 2},
          ]
        },
        {
          //14
          'questionText':
              '15.আপনি কি একজন স্বাস্থ্যকর্মী? (ডাক্তার, নার্স,    সহায়ককর্মী , অথবা সমাজের কোনে কাজে থাকা ইত্যাদি)',
          'answers': [
            {'text': 'a.হ্যাঁ', 'score': 5},
            {'text': 'b.না', 'score': 2},
          ]
        },
        {
          //15
          'questionText': '16.আপনার লক্ষণ গুলো গত ৪৮ ঘণ্টায় কি পরিবর্তন হয়েছে?',
          'answers': [
            {'text': 'a.আগের থেকে ভালো', 'score': 2},
            {'text': 'b.কোন পরিবর্তন নাই', 'score': 2},
            {'text': 'c.আরও খারাপ হয়েছে', 'score': 5},
            {'text': 'd.অনেক বেশী খারাপ', 'score': 7},
          ]
        },
        {
          //16
          'questionText': '17.আপনার ভ্রমনের তথ্য দিন।',
          'answers': [
            {
              'text':
                  'a. গত ১৪ দিনের মধ্যে কোথাও ভ্রমণ করি নাই অথবা করোনা আক্রান্ত কিংবা জ্বর, কাশি, শ্বাসকষ্ট আছে এমন কারো কাছাকাছি যাই নাই',
              'score': 2
            },
            {
              'text':
                  'b. গত ১৪ দিনের মধ্যে জ্বর, কাশি, শ্বাসকষ্ট আছে এমন কারো সংস্পর্শে গিয়েছিলাম (যেমনঃ পরিবার সদস্য / সহকর্মী)',
              'score': 3
            },
            {
              'text':
                  'c. গত ১৪ দিনের মধ্যে বিদেশ থেকে ফিরেছে      এমন কারো সংস্পর্শে গিয়েছিলাম',
              'score': 7
            },
            {
              'text':
                  'd. গত ১৪ দিনের মধ্যে করোনা ভাইরাসে আক্রান্ত এলাকা বা বিদেশে ভ্রমণ করেছিগত ১৪ দিনের মধ্যে করোনা ভাইরাসে আক্রান্ত ব্যক্তির সংস্পর্শে  গিয়েছিলাম',
              'score': 10
            },
          ]
        },
      ];
    } else {
      _questions = _questions = [
        {
          //1
          'questionText': '1. How old are you?',
          'answers': [
            {'text': 'a.0-20', 'score': 2},
            {'text': 'b.21-30', 'score': 2},
            {'text': 'c.31-40', 'score': 2},
            {'text': 'd.41-50', 'score': 3},
            {'text': 'e.51-65', 'score': 4},
            {'text': 'f.65+  ', 'score': 5},
          ]
        },
        {
          //2
          'questionText':
              '2. Please tell us what is your current body temperature.',
          'answers': [
            {
              'text': 'a. Body temperature is normal 96 ° F-98.6 ° F',
              'score': 2
            },
            {'text': 'b.Fever 98.6 ° F-102 F', 'score': 3},
            {'text': 'c. High fever> 102 F', 'score': 5},
          ]
        },
        {
          //3
          'questionText':
              '3.Do you have symptoms of dry cough and sore throat?',
          'answers': [
            {'text': 'a.Yes', 'score': 5},
            {'text': 'b.No', 'score': 2},
          ]
        },
        {
          //4
          'questionText': '4.Do you have symptoms of shortness of breath?',
          'answers': [
            {'text': 'a.Yes', 'score': 5},
            {'text': 'b.No', 'score': 2},
          ]
        },
        {
          //5
          'questionText':
              ' 5. Do you have symptoms of extreme weakness (such as needing help to get to the bathroom) and  runny nose?',
          'answers': [
            {'text': 'a.Yes', 'score': 5},
            {'text': 'b.No', 'score': 2},
          ]
        },
        {
          //6
          'questionText': '6.Do you have any symptoms of abdominal pain?',
          'answers': [
            {'text': 'a.Yes', 'score': 5},
            {'text': 'b.No', 'score': 2},
          ]
        },
        {
          //7
          'questionText': '7.Do you have symptoms of vomiting and Diarrhea ?',
          'answers': [
            {'text': 'a.Yes', 'score': 5},
            {'text': 'b.No', 'score': 2},
          ]
        },
        {
          //8
          'questionText': '8.Do you have symptoms of chest pain and pressure?',
          'answers': [
            {'text': 'a.Yes', 'score': 5},
            {'text': 'b.No', 'score': 2},
          ]
        },
        {
          //9
          'questionText': '9. Do you feel pain in your muscles? ',
          'answers': [
            {'text': 'a.Yes', 'score': 5},
            {'text': 'b.No', 'score': 2},
          ]
        },
        {
          //10
          'questionText':
              '10. DO you have the symptoms of not being able to smell your nose?',
          'answers': [
            {'text': 'a.Yes', 'score': 5},
            {'text': 'b.No', 'score': 2},
          ]
        },
        {
          //10
          'questionText': '11. Do you have any symptoms of itchy or red eyes?',
          'answers': [
            {'text': 'a.Yes', 'score': 5},
            {'text': 'b.No', 'score': 2},
          ]
        },
        {
          //11
          'questionText': '12. Do you having drowsiness ?',
          'answers': [
            {'text': 'a.Yes', 'score': 5},
            {'text': 'b.No', 'score': 2},
          ]
        },
        {
          //13
          'questionText': '13.Do you already have these diseases?',
          'answers': [
            {'text': 'a.Lung Problem', 'score': 2},
            {'text': 'b.Heart Problem', 'score': 2},
            {'text': 'c.High Blood Pressure', 'score': 2},
            {'text': 'd.Diabetes', 'score': 2},
            {'text': 'e.Kidney Problem', 'score': 2},
            {'text': 'f.Cancer', 'score': 2},
            {'text': 'g. Many Other Diseases', 'score': 2},
            {
              'text': 'h.None',
              'score': 2,
            }
          ]
        },
        {
          //14
          'questionText': '14. Do you have a smoking habit?',
          'answers': [
            {'text': 'a.Yes', 'score': 5},
            {'text': 'b.No', 'score': 2},
          ]
        },
        {
          //15
          'questionText':
              '15.Are you a (Doctors, nurses, support staff, or community workers, etc.) health worker? ',
          'answers': [
            {'text': 'a.Yes', 'score': 5},
            {'text': 'b.No', 'score': 2},
          ]
        },
        {
          //16
          'questionText':
              '16. Have your symptoms changed in the last 48 hours?',
          'answers': [
            {'text': 'a.Better than before', 'score': 2},
            {'text': 'b.No change', 'score': 2},
            {'text': 'c.It has become worse', 'score': 5},
            {'text': 'd.Much worse', 'score': 7},
          ]
        },
        {
          //17
          'questionText': '17. Give your travel information.',
          'answers': [
            {
              'text':
                  'a. Have not traveled anywhere in the last 14 days or come near anyone with corona or fever, cough, shortness of breath',
              'score': 2
            },
            {
              'text':
                  'In the last 14 days I have been in contact with someone who has a fever, cough, or shortness of breath (e.g. family members / co-workers).',
              'score': 8
            },
            {
              'text':
                  'c. In the last 14 days, I came in contact with someone who has returned from abroad',
              'score': 20
            },
            {
              'text':
                  'd. In the last 14 days, I have traveled to areas infected with corona virus or people came from abroad.',
              'score': 40
            },
          ]
        },
      ];
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Covid 19 Symptoms Checking',
          style: TextStyle(
            fontSize: 15,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz),
        ),
      ),
    );
  }
}
