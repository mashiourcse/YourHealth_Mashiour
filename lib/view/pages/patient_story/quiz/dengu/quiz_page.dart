import 'package:flutter/material.dart';
import 'package:yourhealth/view/pages/patient_story/quiz/dengu/quiz.dart';
import 'package:yourhealth/view/pages/patient_story/quiz/dengu/result.dart';

class DenguQuizPage extends StatefulWidget {
  @override
  _DenguQuizPageState createState() => _DenguQuizPageState();
}

class _DenguQuizPageState extends State<DenguQuizPage> {
  var _questionIndex = 0;

  final _questions = const [
    {
      //1
      'questionText': '1.Are you feeling sudden, high fever?',
      'answers': [
        {'text': 'a.Yes ', 'score': 1},
        {'text': 'b.No ', 'score': 2},
      ]
    },
    {
      //2
      'questionText': '2.Severe headaches?',
      'answers': [
        {'text': 'a.Yes ', 'score': 1},
        {'text': 'b.No, ', 'score': 2},

        //{'text': 'All of them', 'score': 1},
      ]
    },
    {
      //3
      'questionText': '3.Pain behind the eyes',
      'answers': [
        {'text': 'a.Yes ', 'score': 1},
        {'text': 'b.No,', 'score': 2},
      ]
    },
    {
      //4
      'questionText': '4.Are you feeling Severe joint and muscle pain?',
      'answers': [
        {'text': 'a.Yes ', 'score': 1},
        {'text': 'b.No ', 'score': 2},
      ]
    },
    {
      //5
      'questionText': '5.Are you feeling Fatigue?',
      'answers': [
        {'text': 'a.Yes ', 'score': 1},
        {'text': 'b.No, I am not having this symptoms', 'score': 2},
      ]
    },
    {
      //6
      'questionText': '6.Are You having Nausea?',
      'answers': [
        {'text': 'a.Yes ', 'score': 1},
        {'text': 'b.No, I am not having this symptoms', 'score': 2},
      ]
    },
    {
      //7
      'questionText': '7.Swollen glands on body?',
      'answers': [
        {'text': 'a.Yes ', 'score': 1},
        {'text': 'b.No, I am not having this symptoms', 'score': 2},
      ]
    },
    {
      //8
      'questionText': '8.Are you Vomiting?',
      'answers': [
        {'text': 'a.Yes ', 'score': 1},
        {'text': 'b.No, I am not having this symptoms', 'score': 2},
      ]
    },
    {
      //9
      'questionText':
          '8.Are you going through skin rash with red spots,which appears two to five days after the onset of fever?',
      'answers': [
        {'text': 'a.Yes ', 'score': 1},
        {'text': 'b.No, I am not having this symptoms', 'score': 2},
      ]
    },
    {
      //10
      'questionText':
          '10.Mild bleeding (such a nose bleed, bleeding gums, or easy bruising)',
      'answers': [
        {'text': 'a.Yes ', 'score': 1},
        {'text': 'b.No ', 'score': 2},
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
        //fontFamily: 'Galada',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Dengue Symptom Check',
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
