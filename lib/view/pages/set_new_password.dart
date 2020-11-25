import 'package:flutter/material.dart';
import 'package:yourhealth/view/pages/login_page.dart';
import 'package:yourhealth/view/widgets/widgets.dart';

class SetNewPasswordPage extends StatelessWidget {
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
              'Create new password',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Your new password must be different from the old one',
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
                  labelText: 'New password',
                ),
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
                  labelText: 'Re-enter new password',
                ),
              ),
            ),
            const SizedBox(height: 30),
            RoundedButton(
              label: 'Create',
              bgColor: Colors.deepPurple[900],
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
