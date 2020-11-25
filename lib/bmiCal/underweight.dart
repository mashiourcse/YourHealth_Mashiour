import 'package:flutter/material.dart';

class UnderWeight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diet Plan for Underweight'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/yhlogo.PNG',
              height: 500,
              width: double.infinity,
            ),
            // Image.network(
            //   'https://happyndhealthylife.com/wp-content/uploads/2019/12/chart-1024x576.jpg',
            //   width: 400,
            //   height: 300,
            // ), //Underweight diet chat
            const SizedBox(
              height: 20,
            ),
            //Nhs
            Container(
              color: Colors.deepPurpleAccent,
              child: const Text(
                'Before starting a weight gain diet plan you need to know why are you underweight? If you are losing weight drastically then it could be some medical conditions like this you need to consult with doctor.',
                softWrap: true,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Eating disorders',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.cyanAccent,
              child: const Text(
                'Eating Disorder: Eating disorder is a group of conditions marked by an unhealthy relationship with food. This disease is very common in US people. Among 100 there are 2 to 5 young children are suffering from this. This condition is characterized by eating very little or withdrawing certain foods that lead to severe weight loss.',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Depression:',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.lightBlue,
              child: const Text(
                'Now a day’s depression is one of the main reasons for drastically weight loss. You are unknowingly suffering from severe depression that leads you to reduce appetite and cause unhealthy weight loss.',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow),
                softWrap: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Diabetics:',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Having uncontrolled type 1 diabetics can lead to several weight loss.',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Thyroid Problem:',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Having an hyperthyroidism can boost metabolism that cause unhealthy weight loss.',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Celiac disease: ',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.lightBlue,
              child: const Text(
                'This health conditions causes by gluten intolerance on your body and the fact is maximum people with this celiac disease don’t know that they have it. Hence this will lead you to severe weight loss.',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'What are the consequences of being underweight?',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.network(
              'https://i.pinimg.com/originals/25/ea/ab/25eaab6f09f056d0fd50d802c37720b9.png',
              width: 300,
              height: 200,
            ),
            Container(
              color: Colors.lightBlue,
              child: const Text(
                'Now a day’s obesity is one of the biggest health issues. But being underweight is also bad for your health. For those who are underweight can also impair your immune function, raise your risk of infections, lead to osteoporosis, and fractures. Being underweight sometimes several health issues may crop up eventually.',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.lightBlue,
              child: const Text(
                'Now a day’s obesity is one of the biggest health issues. But being underweight is also bad for your health. For those who are underweight can also impair your immune function, raise your risk of infections, lead to osteoporosis, and fractures. Being underweight sometimes several health issues may crop up eventually.',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.network(
              'https://assets.lybrate.com/q_auto:eco,f_auto,w_850/imgs/product/kwds/diet-chart/Underweight-Diet-Chart-v1.jpg',
              width: 300,
              height: 200,
            ),

            const Text(
              'The following foods has a huge nutrations and protin',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            //
          ],
        ),
      ),
    );
  }
}
