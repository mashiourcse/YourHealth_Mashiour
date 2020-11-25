import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yourhealth/data/services/auth_services.dart';
import 'package:yourhealth/view/pages/auth_dashboard.dart';
import 'package:yourhealth/view/widgets/header.dart';
import 'package:yourhealth/view/widgets/rounded_button.dart';
import 'package:yourhealth/view/widgets/user_avatar.dart';

class VerifyEmail extends StatelessWidget {
  final bool type;

  VerifyEmail({this.type});
  @override
  Widget build(BuildContext context) {
    String text;
    if (type) {
      text =
          'You have successfully registered to Your Health. Please follow the instructions in the verification mail sent to you. You may log in after verifying your email.';
    } else {
      text =
          'An email has been sent to you for resetting your password. Please, follow the instructions there to reset your password.';
    }
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
                label: 'Sign In',
                bgColor: Colors.blue,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AuthDashboardPage()));
                }),
            SizedBox(height: 30),
            // RoundedButton(
            //     label: 'Resend Email',
            //     bgColor: Colors.blue,
            //     onPressed: () {
            //       final user = FirebaseAuth.instance.currentUser;
            //       if (!type) {
            //         AuthenticationService().resetPassword(user.email);
            //       } else {
            //         user.sendEmailVerification();
            //       }
            //     }),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
