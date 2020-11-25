import 'package:flutter/material.dart';
import 'package:yourhealth/view/pages/patient_story/quiz/dengu/quiz_page.dart';
import 'package:yourhealth/view/pages/patient_story/quiz/diabetes/quiz_page.dart';
import 'package:yourhealth/view/pages/patient_story/quiz/malaria/quiz_page.dart';
import 'package:yourhealth/view/pages/patient_story/quiz/seasonal_flu/quiz_page.dart';
import 'package:yourhealth/view/pages/patient_story/quiz/urinary/quiz_page.dart';

enum Options { Yes, No }

class PrimaryScreeningPage extends StatefulWidget {
  @override
  _PrimaryScreeningPageState createState() => _PrimaryScreeningPageState();
}

class _PrimaryScreeningPageState extends State<PrimaryScreeningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Primarily 5 Disease Symptoms Checking'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DenguQuizPage()));
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(
                        'Dengue',
                        style: TextStyle(fontSize: 30),
                      ),
                      leading: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Aedes_aegypti_feeding.jpg/290px-Aedes_aegypti_feeding.jpg',
                        height: 80,
                        width: 80,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DiabetesQuizPage()));
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(
                        'Diabetes',
                        style: TextStyle(fontSize: 30),
                      ),
                      leading: Image.network(
                        'https://labblog.uofmhealth.org/sites/lab/files/2018-10/michigan-med-l-praise2-01%20%281%29.jpg',
                        height: 80,
                        width: 80,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MalariaQuizPage()));
                  },
                  child: Card(
                    child: ListTile(
                      leading: Image.network(
                        'https://www.daily-sun.com/assets/news_images/2016/04/25/malaria.jpg',
                        height: 80,
                        width: 80,
                        fit: BoxFit.fill,
                      ),
                      title: Text(
                        'Malaria',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FluQuizPage()));
                  },
                  child: Card(
                    child: ListTile(
                      leading: Image.network(
                        'https://afterhoursmedical.com/wp-content/uploads/2019/01/flu-season.jpg',
                        height: 80,
                        width: 80,
                        fit: BoxFit.fill,
                      ),
                      title: Text(
                        'Seasonal Flu',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UrinaryQuizPage()));
                  },
                  child: Card(
                    child: ListTile(
                      leading: Image.network(
                        'https://assets.lybrate.com/q_auto:eco,f_auto,w_450/imgs/dt/tp/6481735f14e5521b064e522bcb6e4756/42829ee5b5de192330cc59807498b0ff/d9ff6b.jpg',
                        height: 80,
                        width: 80,
                        fit: BoxFit.fill,
                      ),
                      title: Text(
                        'Urinary Tract Infection',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Question {
  final String question;
  Options selected;

  Question({this.question, this.selected});
}
