import 'package:flutter/material.dart';
import 'package:yourhealth/data/services/auth_services.dart';
import 'package:yourhealth/view/email_confirm.dart';
import 'package:yourhealth/view/widgets/widgets.dart';

class InstructionPage extends StatefulWidget {
  @override
  _InstructionPageState createState() => _InstructionPageState();
}

class _InstructionPageState extends State<InstructionPage> {
  String _email = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              'Forgot Password?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Enter your registered email',
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
                onChanged: (value) => _email = value,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Email',
                ),
              ),
            ),
            const SizedBox(height: 30),
            RoundedButton(
              label: 'Reset my password',
              bgColor: Colors.deepPurple[900],
              onPressed: () {
                _resetButtonPressed(context);
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
                  _resetButtonPressed(context);
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  _resetButtonPressed(BuildContext context) async {
    print(_email);
    await AuthenticationService().resetPassword(_email);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => VerifyEmail(type: false)));
  }
}
