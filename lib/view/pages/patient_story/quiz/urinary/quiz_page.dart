import 'package:flutter/material.dart';
import 'package:yourhealth/view/pages/patient_story/quiz/urinary/quiz.dart';
import 'package:yourhealth/view/pages/patient_story/quiz/urinary/result.dart';

class UrinaryQuizPage extends StatefulWidget {
  @override
  _UrinaryQuizPageState createState() => _UrinaryQuizPageState();
}

class _UrinaryQuizPageState extends State<UrinaryQuizPage> {
  var _questionIndex = 0;
  final _questions = const [
    {
      //1
      'questionText': '1.A burning feeling when passing urine',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},
      ]
    },
    {
      //2
      'questionText': '2.Feeling frequent urination',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},

        //{'text': 'All of them', 'score': 1},
      ]
    },
    {
      //3
      'questionText':
          '3.Urine looks dark, cloudy, or reddish in color. (Blood may be present in the urine.)',
      'answers': [
        {'text': 'a.Dark ', 'score': 2},
        {'text': 'b.Cloudy', 'score': 2},
        {'text': 'c.Reddish ', 'score': 2},
        {'text': 'd.No, I am not having this symptoms', 'score': 1},
      ]
    },
    {
      //4
      'questionText': '4.Urine smells bad',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},
      ]
    },
    {
      //5
      'questionText': '5.Feeling pain during Urination',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},
      ]
    },
    {
      //6
      'questionText':
          '6.Pain in the belly (abdomen) area below the bellybutton, or in the back or side, below the ribs',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},
      ]
    },
    {
      //7
      'questionText': '7.Nausea or vomiting',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},
      ]
    },
    {
      //8
      'questionText': '8.Are you feeling Tired in day to day life?',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No, I am not having this symptoms', 'score': 1},
      ]
    },
    {
      //9
      'questionText':
          '9.Have a strong urge to urinate, but only a small amount of urine is passed" Are you having this?',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},
      ]
    },
    {
      //10
      'questionText': '10.Pain or pressure in your back or lower abdomen',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},
      ]
    },
  ];

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
    return MaterialApp(
      theme: ThemeData(
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Urinary Tract Infection Symptom Check',
            style: TextStyle(
              fontSize: 15,
              fontStyle: FontStyle.italic,
            ),
          ),
          centerTitle: true,
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              )

          ),
          automaticallyImplyLeading: true,
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
      ),
    );
  }
}
