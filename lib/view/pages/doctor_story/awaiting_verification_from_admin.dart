import 'package:flutter/material.dart';
import 'package:yourhealth/data/services/auth_services.dart';
import 'package:yourhealth/view/pages/auth_dashboard.dart';
import 'package:yourhealth/view/widgets/widgets.dart';

class AwaitingVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String text =
        'You have successfully registered to Your Health. Please wait until our authority panel verifies your information and approves your registration as a doctor.';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Notice'),
      ),
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
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 30),
            RoundedButton(
                label: 'Sign Out',
                bgColor: Colors.blue,
                onPressed: () {
                  AuthenticationService().signOutUser();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AuthDashboardPage()));
                }),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
