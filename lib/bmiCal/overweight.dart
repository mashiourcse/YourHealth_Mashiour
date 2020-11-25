import 'package:flutter/material.dart';

class OverWeight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diet Plan for Overweight'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [    //overweight
            Image.asset(
              'assets/images/overweight.jpg', //GreatShapeMeal
              height: 500,
              width: double.infinity,

            ),
            // Image.network(
            //   'https://www.acc.org//-/media/Non-Clinical/Images/Membership/Member-Benefits-and-Resources/Member-Publications/Cardiology/2018/07/Cover-Story-Figure-2.jpg',
            //   height: 300,
            //   width: 400,
            // ),
            //new added
            Text(
              '1.Eat the Right Foods and Portion Each Meal',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            ),
            SizedBox(
              height: 20,
            ),
            //new added
            Container(color: Colors.lightBlue,
              child: Text(
                'No matter how bad your stomach is telling you to go for candy over healthy food, (1) try to stay away from sweets. Sugar from candy will not help you get in shape (2) Fruits and vegetables are the best thing to eat when getting into shape. Apples, for example, do a good job at making the stomach feel full for up to 3 to 4 hours. ',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Text(
              '2.Keep Track of Calories and Food Intake Per Day',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            ),
            SizedBox(
              height: 20,
            ),
            //new added
            Container(color: Colors.lightBlue,
              child: Text(
                'Keeping track of how many calories you eat in a day will be helpful in planning out your physical exercising. Ever wonder why body builders\' body masses are so big? That\'s because they plan out their meals and take in more (healthy) calories than the average person. On the other hand, losing weight and striving for a skinnier physique will involve more physical exercise than calories you ingest.',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Text(
              '3.Do daily Exercises',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            ),
            SizedBox(
              height: 20,
            ),
            //new added
            Container(color: Colors.lightBlue,
              child: Text(
                'Exercise daily for at least an hour. You do not have to kill yourself from running, jogging, etc., but you should have some sort of moderate physical activity in your everyday life. Here Given a list of exercise: ',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Text(
              '4.Be Sure to Get Sleep',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            ),
            SizedBox(
              height: 20,
            ),
            //new added
            Container(color: Colors.lightBlue,
              child: Text(
                'Even though most of us have eight-hour jobs during the day or night, it is crucial to get enough sleep to recharge the body\'s batteries. Six to eight hours of sleep will keep the body going throughout the day, but if you happen to feel tired at any point after coming home from work, by all means take a small nap before exercising. You should only nap for about a half hour. This will prevent you from staying up later in the night.',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Text(
              '5.Stay Motivated ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            ),
            SizedBox(
              height: 10,
            ),
            Container(color: Colors.lightBlue,
              child: Text(
                'An important key to being in shape is to set goals and keep a positive mindset. If you stay positive, you will be able to push yourself to get that fit body you\'ve always wanted.',
                style: TextStyle(
                    fontSize: 15,
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
