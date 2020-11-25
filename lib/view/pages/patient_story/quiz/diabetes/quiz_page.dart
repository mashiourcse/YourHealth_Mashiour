import 'package:flutter/material.dart';
import 'package:yourhealth/view/pages/patient_story/quiz/diabetes/quiz.dart';
import 'package:yourhealth/view/pages/patient_story/quiz/diabetes/result.dart';

class DiabetesQuizPage extends StatefulWidget {
  @override
  _DiabetesQuizPageState createState() => _DiabetesQuizPageState();
}

class _DiabetesQuizPageState extends State<DiabetesQuizPage> {
  var _questionIndex = 0;
  final _questions = const [
    {
      //1
      'questionText': '1.Is your thirst Increased ?',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},
      ]
    },
    {
      //2
      'questionText': '2.Having Frequent urination?',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},

        //{'text': 'All of them', 'score': 1},
      ]
    },
    {
      //3
      'questionText': '3.Are you feeling Extreme hunger?',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},
      ]
    },
    {
      //4
      'questionText': '4.Going through unexplained weight loss?',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},
      ]
    },
    {
      //5
      'questionText': '5.Are you feeling fatigue ?',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},
      ]
    },
    {
      //6
      'questionText': '6.Are you feeling Irritability?',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},
      ]
    },
    {
      //7
      'questionText': '7.Are you viewing in Blurred vision?',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},
      ]
    },
    {
      //8
      'questionText': '8.Having Slow Healing of Cuts and Wounds ?',
      'answers': [
        {'text': 'a.Yes ', 'score': 2},
        {'text': 'b.No ', 'score': 1},
      ]
    },
    {
      //9
      'questionText':
          '9.Going through frequent infections, such as gums or skin infections and vaginal infections',
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
            'Diabetes Symptom Check',
            style: TextStyle(
              fontSize: 18,
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
