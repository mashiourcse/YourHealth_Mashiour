import 'package:flutter/material.dart';
import 'package:yourhealth/view/pages/set_new_password.dart';
import 'package:yourhealth/view/widgets/widgets.dart';

class VerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Header(),
            const SizedBox(height: 40),
            UserAvatar(),
            const SizedBox(height: 30),
            Text(
              'Verification',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Check your email for the code',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Verification code',
                ),
              ),
            ),
            const SizedBox(height: 30),
            RoundedButton(
              label: 'Verify now',
              bgColor: Colors.deepPurple[900],
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SetNewPasswordPage()));
              },
            ),
            const SizedBox(height: 30),
            Container(
              alignment: Alignment.center,
              child: InkWell(
                child: Text(
                  'Resend mail',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                onTap: () {
                  print('Inkwell Tapped!');
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
