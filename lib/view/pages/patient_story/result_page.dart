import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Primary Screening Result'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            Header(),
            SizedBox(height: 40),
            Placeholder(),
            SizedBox(height: 30),
            Placeholder(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
