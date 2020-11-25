import 'package:flutter/material.dart';

class GreatShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Great Shape'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/obesemain.jpg', //GreatShapeMeal
              height: 500,
              width: double.infinity,

            ),
            //new added
            const  Text(
              '1.Change your thinking and behavior.',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const    SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/overthinking.jpg', // overthinking
              height: 500,
              width: double.infinity,

            ),
            //new added
            Container(color: Colors.lightBlue,
              child: const  Text(
                'Your weight and health need to be front and center in your thinking. Remind yourself that maintaining your weight and living a healthy lifestyle are a permanent commitment, not a one-shot deal. Remember the many benefits that come with having a healthy weight - and the physical and health limitations that carrying too much weight can impose.',
                style: const  TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const  Text(
              '2.Stay active. ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const  SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/active.jpg', //GreatShapeMeal
              height: 500,
              width: double.infinity,

            ),
            //new added
            Container(color: Colors.lightBlue,
              child:const   Text(
                'Setting goals and rewarding yourself when you meet them can be a good motivator.The human body is made to move, yet so many of our daily activities keep us from doing just that: driving, working at the computer, watching television. People of all ages and body types benefit from physical activity.',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const Text(
              '3.Change your diet.',
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
              'assets/images/obesediet.jpg', //GreatShapeMeal
              height: 500,
              //width: double.infinity,

            ),
            Image.asset(
              'assets/images/obesemeal.jpg', //GreatShapeMeal
              height: 500,
              //width: double.infinity,

            ),
            Container(color: Colors.lightBlue,
              child: const  Text(
                'You may be referred to a dietician who can help you with a plan to lose one to two pounds per week. To lose weight, you have to reduce the number of calories you consume. Start by tracking everything you eat. “You have to become a good record-keeper,”  Dr. Eckel said. “Reduce calories by 500 calories per day to lose about a one pound a week, or cut 1,000 calories a day to lose about two pounds a week.”',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const  Text(
              '4.Daily Exercise ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const  SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/images/obeseexi.png', //GreatShapeMeal
              height: 500,
              //width: double.infinity,

            ),
            Container(color: Colors.lightBlue,
              child: Column(
                children: [
                  const  Text(
                    'i. Start slowly. If you haven’t been active for a while, ease into your new exercise program and give your body time to adjust to the activity.',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const  Text(
                    'ii. Do something you enjoy. Take in the scenery as you walk or bike through a neighborhood park. Listen to podcasts while you use an elliptical machine.',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const  Text(
                    'iii. Exercise with a buddy. Connecting with others can keep you motivated to exercise more.',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const  Text(
                    'iv. Stay hydrated.Drink plenty of water before, during, and after you exercise.',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const  Text(
                    'v. Change your workout routine from time to time. A variety of physical activities helps you stay motivated and prevents boredom.',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const  Text(
                    'vi. Wear a fitness tracker. Health apps and fitness trackers can help you set goals. Keeping track of your progress can be motivating.',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            const  Text(
              '6.Be Sure to Get Sleep',
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
          ],
        ),
      ),
    );
  }
}
//https://www.gov.uk/government/news/new-obesity-strategy-unveiled-as-country-urged-to-lose-weight-to-beat-coronavirus-covid-19-and-protect-the-nhs