import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yourhealth/data/services/auth_services.dart';
import 'package:yourhealth/view/pages/admin_story/admin_home.dart';
import 'package:yourhealth/view/widgets/widgets.dart';

class AdminLoginPage extends StatefulWidget {
  @override
  _AdminLoginPageState createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Admin Login'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //const Spacer(),
                Header(),
                const SizedBox(height: 40),
                UserAvatar(),
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
                  label: 'Log In As Admin',
                  bgColor: Colors.blue[600],
                  onPressed: () {
                    _signInButtonPressed(context);
                  },
                ),
                const SizedBox(height: 30),
                Text(
                  _error,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
                // const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _signInButtonPressed(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      dynamic result = await auth.signInadmin(_email, _password);

      if (result == null) {
        setState(() => _error = 'Something went wrong!');
      } else {
        await _fireStore
            .collection('admins')
            .doc(result.uid)
            .get()
            .then((value) {
          if (value.exists) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => AdminHomePage()),
                (Route<dynamic> route) => false);
          } else {
            setState(() {
              _error = 'The credentials are not of an authorized admin';
            });
            auth.signOutUser();
          }
        });
      }
    }
  }
}
