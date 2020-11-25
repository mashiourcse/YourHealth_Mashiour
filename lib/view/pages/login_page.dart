import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yourhealth/data/services/auth_services.dart';
import 'package:yourhealth/view/pages/doctor_story/doc_view.dart';
import 'package:yourhealth/view/pages/google_sign_in_info_page.dart';
import 'package:yourhealth/view/pages/instruction_page.dart';
import 'package:yourhealth/view/pages/patient_story/patient_home.dart';
import 'package:yourhealth/view/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  final int userType;

  LoginPage({this.userType});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthenticationService auth = AuthenticationService();
  final _fireStore = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormState>();

  String _email = '';

  String _password = '';

  String _name = '';

  String _error = '';

  String _role = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign In',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Header(),
              const SizedBox(height: 40),
              //UserAvatar(),
              Image.asset(
                'assets/images/yhlogo.PNG',
                height: 100,
              ),
              const SizedBox(height: 30),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  validator: (value) =>
                      value.isEmpty ? 'Please enter a valid email' : null,
                  onChanged: (val) {
                    setState(() => _email = val);
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Email',
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
                  validator: (value) => value.length < 6
                      ? 'Password must be at least 6 characters long'
                      : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => _password = val);
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Password',
                  ),
                ),
              ),
              const SizedBox(height: 30),
              RoundedButton(
                label: 'Sign In',
                bgColor: Colors.blue[600],
                onPressed: () {
                  _signInButtonPressed(context);
                },
              ),
              const SizedBox(height: 30),
              // IconButton(
              //     icon: Container(
              //       alignment: Alignment.center,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Image.network(
              //               'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1004px-Google_%22G%22_Logo.svg.png'),
              //           SizedBox(width: 5),
              //           Text('Sign In With Google Account'),
              //         ],
              //       ),
              //     ),
              //     onPressed: () {
              //       _signInWithGoogle(context);
              //     }),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                child: InkWell(
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InstructionPage()));
                  },
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                _error,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _signInButtonPressed(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      dynamic result = await auth.signInUser(_email, _password);

      if (result == null) {
        setState(() => _error = 'Incorrect Email / Password!');
      } else {
        DocumentSnapshot snapshot =
            await _fireStore.collection('users').doc(result.uid).get();
        if (snapshot != null) {
          Map<String, dynamic> data = snapshot.data();
          _role = data['role'];
          print(_role);
        } else {
          setState(() {
            _error = 'Incorrect Email / Password!';
            return;
          });
        }
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    _role == 'patient' ? PatientHome() : DocView()),
            (Route<dynamic> route) => false);
      }
    }
  }

  _signInWithGoogle(BuildContext context) async {
    User user = await AuthenticationService().googleSignIn();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((value) {
      if (value.exists) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => PatientHome()),
            (Route<dynamic> route) => false);
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GoogleSignInInfo(user: user)));
      }
    });
  }
}
