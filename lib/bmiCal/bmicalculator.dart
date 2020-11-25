import 'underweight.dart';
import 'package:flutter/material.dart';

import 'greatshape.dart';
import 'overweight.dart';

class Bmi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BmiState();
  }
}

class BmiState extends State<Bmi> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double inches = 0.0;
  double kg = 0.0;
  double result = 0.0;
  String _resultReading = "";

  String _finalResult = "";
  Widget _bminewpage;
  void _calculateBMI() {
    //Resourse 1: https://www.bcbst.com/providers/MPMTools/BMICalculator.shtm
    //Resource 2:  http://www.epic4health.com/bmiformula.html

//
//    BMI	Weight Status
//    Below 18.5	Underweight
//    18.5 – 24.9	Normal
//    25.0 – 29.9	Overweight
//    30.0 and Above	Obese

    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      inches = height * 12;
      double weight = double.parse(_weightController.text);
      kg = weight * 2.20462;

      if ((_ageController.text.isNotEmpty || age > 0) &&
          ((_heightController.text.isNotEmpty || inches > 0) &&
              (_weightController.text.isNotEmpty || kg > 0))) {
        result = kg / (inches * inches) * 703; // our BMI

        //Do the reading
        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultReading =
              "Your Are Underweight , Click here for Fitness guide";
          _bminewpage = UnderWeight();
          print(_resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 &&
            result < 25) {
          _resultReading =
              "Your Are Great Shape , Click here for Fitness guide!"; // Normal
          _bminewpage = GreatShape();

          print(_resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 25.0 &&
            result < 30) {
          _resultReading =
              "Your Are Overweight  , Click here for Fitness guide";
          _bminewpage = OverWeight();
        } else if (double.parse(result.toStringAsFixed(1)) >= 30.0) {
          _resultReading = "Your Are Obese, Click here for Fitness guide";
          _bminewpage = UnderWeight();
        }
      } else {
        result = 0.0;
      }
    });

    _finalResult = "Your BMI: ${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            Image.asset(
              'assets/images/bmi.jpg',
              height: 250,
              width: 200,

            ),


            // Image.network(
            //   'https://www.stylecraze.com/wp-content/themes/buddyboss-child/images/man-body-mass-index-vector.jpg',
            //   height: 250,
            //   width: 200,
            // ),
            Container(
              margin: const EdgeInsets.all(3.0),
              height: 245.0,
              width: 290.0,
              color: Colors.grey.shade300,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Age',
                        hintText: 'e.g: 34',
                        icon: Icon(Icons.person_outline)),
                  ),
                  TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Height in feet',
                          hintText: 'e.g 5.11',
                          icon: Icon(Icons.insert_chart))),
                  TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Weight in Kg',
                          hintText: 'e.g 75',
                          icon: Icon(Icons.line_weight))),

                  //Padding(padding: EdgeInsets.all(10.6)),

                  //calculate button
                  Container(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      onPressed: _calculateBMI,
                      color: Colors.deepPurple,
                      child: Text('Calculate'),
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "$_finalResult",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontSize: 25),
                ),
                Padding(padding: const EdgeInsets.all(5.0)),
                GestureDetector(
                    child: Text(
                      "$_resultReading",
                      style: TextStyle(
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          fontSize: 25),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => _bminewpage),
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
