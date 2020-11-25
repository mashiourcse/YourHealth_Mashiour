import 'package:flutter/material.dart';
import 'package:yourhealth/view/pages/patient_story/quiz/malaria/quiz.dart';
import 'package:yourhealth/view/pages/patient_story/quiz/malaria/result.dart';

class MalariaQuizPage extends StatefulWidget {
  @override
  _MalariaQuizPageState createState() => _MalariaQuizPageState();
}

class _MalariaQuizPageState extends State<MalariaQuizPage> {
  var _questionIndex = 0;
  final _questions = const [
    {
      //1
      'questionText':
          '1.Are you having high temperature 100.4f (38c) or above?',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 2},
      ]
    },
    {
      //2
      'questionText': '2.Are you having Profuse sweating?',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},

        //{'text': 'All of them', 'score': 1},
      ]
    },
    {
      //3
      'questionText': '3.Are you feeling headache?',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},
      ]
    },
    {
      //4
      'questionText': '4.Are you feeling Nausea',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No, I am not having this symptoms', 'score': 1},
      ]
    },
    {
      //5
      'questionText': '5.Are you vomiting?',
      'answers': [
        {'text': 'a.Yes ', 'score': 3},
        {'text': 'b.No, I am not having this symptoms', 'score': 1},
        {'text': 'b. A little bit ', 'score': 2},
      ]
    },
    {
      //6
      'questionText': '6.Are you having Abdominal pain?',
      'answers': [
        {'text': 'a.Yes ', 'score': 3},
        {'text': 'b.No, I am not having this symptoms', 'score': 1},
        {'text': 'b. A little bit ', 'score': 2},
      ]
    },
    {
      //7
      'questionText': '7.Are you having diarrhea?',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},
      ]
    },
    {
      //8
      'questionText': '8.Are you having muscle pain?',
      'answers': [
        {'text': 'a.Yes ', 'score': 3},
        {'text': 'b.No, I am not having this symptoms', 'score': 1},
        {'text': 'b. A little bit ', 'score': 1},
      ]
    },
    {
      //9
      'questionText': '9.Are you having convulsions?',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No, I am not having this symptoms', 'score': 1},
      ]
    },
    {
      //10
      'questionText': '10.Is blood passing with your stool?',
      'answers': [
        {'text': 'a.Yes ', 'score': 3},
        {'text': 'b.No, I am not having this symptoms', 'score': 1},
        {'text': 'b. A liitle bit ', 'score': 2},
      ]
    },
    {
      //9
      'questionText': '11.Is chills and body aches present?',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No, I am not having this symptoms', 'score': 1},
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
            'Malaria Symptom Check',
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
