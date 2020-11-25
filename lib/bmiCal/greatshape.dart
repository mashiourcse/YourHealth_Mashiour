import 'package:flutter/material.dart';

class GreatShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Great Shape'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/greatshapeMain.png', //GreatShapeMeal
              height: 500,
              width: double.infinity,

            ),
            //new added
            const  Text(
              '1.Eat the Right Foods and Portion Each Meal',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const    SizedBox(
              height: 20,
            ),
            //new added
            Container(color: Colors.lightBlue,
              child: const  Text(
                'No matter how bad your stomach is telling you to go for candy over healthy food, (1) try to stay away from sweets. Sugar from candy will not help you get in shape (2) Fruits and vegetables are the best thing to eat when getting into shape. Apples, for example, do a good job at making the stomach feel full for up to 3 to 4 hours. ',
                style: const  TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const  Text(
              '2.Keep Track of Calories and Food Intake Per Day',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const  SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/GreatShapeMeal.jpg', //GreatShapeMeal
              height: 500,
              width: double.infinity,

            ),
            //new added
            Container(color: Colors.lightBlue,
              child:const   Text(
                'Keeping track of how many calories you eat in a day will be helpful in planning out your physical exercising. Ever wonder why body builders\' body masses are so big? That\'s because they plan out their meals and take in more (healthy) calories than the average person. On the other hand, losing weight and striving for a skinnier physique will involve more physical exercise than calories you ingest.',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const Text(
              '3.Do daily Exercises',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            //new added
            Image.asset(
              'assets/images/GreatShapeExercise.jpg', //GreatShapeMeal //greatShapeexi
              height: 500,
              //width: double.infinity,

            ),
            Image.asset(
              'assets/images/greatShapeexi.jpg',
              height: 500,
              width: double.infinity,

            ),
            Container(color: Colors.lightBlue,
              child: const  Text(
                'Exercise daily for at least an hour. You do not have to kill yourself from running, jogging, etc., but you should have some sort of moderate physical activity in your everyday life. Here Given a list of exercise: ',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const  Text(
              '4.Be Sure to Get Sleep',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            //new added
            Container(color: Colors.lightBlue,
              child: const  Text(
                'Even though most of us have eight-hour jobs during the day or night, it is crucial to get enough sleep to recharge the body\'s batteries. Six to eight hours of sleep will keep the body going throughout the day, but if you happen to feel tired at any point after coming home from work, by all means take a small nap before exercising. You should only nap for about a half hour. This will prevent you from staying up later in the night.',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const  Text(
              '5.Stay Motivated ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const  SizedBox(
              height: 10,
            ),
            Container(color: Colors.lightBlue,
              child: const  Text(
                'An important key to being in shape is to set goals and keep a positive mindset. If you stay positive, you will be able to push yourself to get that fit body you\'ve always wanted.',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
