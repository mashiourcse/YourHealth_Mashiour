import 'package:flutter/material.dart';
import 'package:yourhealth/view/pages/patient_story/quiz/seasonal_flu/quiz.dart';
import 'package:yourhealth/view/pages/patient_story/quiz/seasonal_flu/result.dart';

class FluQuizPage extends StatefulWidget {
  @override
  _FluQuizPageState createState() => _FluQuizPageState();
}

class _FluQuizPageState extends State<FluQuizPage> {
  var _questionIndex = 0;
  final _questions = const [
    {
      //1
      'questionText': '1.Do you have a high fever?',
      'answers': [

        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},
      ]
    },
    {
      //2
      'questionText': '2.Do you have a low-grade fever?',
      'answers': [

        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},

        //{'text': 'All of them', 'score': 1},
      ]
    },
    {
      //3
      'questionText': '3.Do you have a stuffy nose?',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No, I am not having this symptoms', 'score': 1},
      ]
    },
    {
      //4
      'questionText': '4.Do you have a headache?',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},
      ]
    },
    {
      //5
      'questionText': '5.Do you have a severe cough?',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},
      ]
    },
    {
      //6
      'questionText': '6.Do you have severe aches and pains?',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},
      ]
    },
    {
      //7
      'questionText': '7.Do you feel fatigued?',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},
      ]
    },
    {
      //8
      'questionText': '8.Do you have a sore throat?',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},
      ]
    },
    {
      //9
      'questionText': '9.Do you have chills?',
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
        fontFamily: 'Galada',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Seasonal Flu Symptom Check',
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
