import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yourhealth/data/services/auth_services.dart';
import 'package:yourhealth/view/pages/patient_story/patient_home.dart';

import '../widgets/widgets.dart';

class GoogleSignInInfo extends StatefulWidget {
  final User user;

  GoogleSignInInfo({this.user});
  @override
  _GoogleSignInInfoState createState() => _GoogleSignInInfoState();
}

class _GoogleSignInInfoState extends State<GoogleSignInInfo> {
  final AuthenticationService auth = AuthenticationService();
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _gender = '';
  String _age = '';
  String _phoneNumber = '';
  String _bloodGroup = '';
  String _error = '';
  bool checkBoxValue = false;
  List<String> _genders = ['Male', 'Female'];
  List<String> _bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //const Spacer(),
                Text(
                  'Register As Patient',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                //Header(),
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
                        value.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) {
                      setState(() => _name = val);
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Full Name',
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          validator: (value) =>
                              value.isEmpty ? 'Please enter your age' : null,
                          onChanged: (val) {
                            setState(() => _age = val);
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Age',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Flexible(
                      child: Container(
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField<String>(
                                //value: _value,
                                validator: (value) => value == null
                                    ? 'Please select a gender'
                                    : null,
                                hint: Text('Gender'),
                                value: _gender == '' ? null : _gender,
                                items: _genders.map((e) {
                                  return DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() => _gender = value);
                                  print(_gender);
                                }),
                          )),
                    ),
                  ],
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
                        value.isEmpty ? 'Please enter a phone number' : null,
                    onChanged: (val) {
                      setState(() => _phoneNumber = val);
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Phone Number',
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
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<String>(
                        //value: _value,
                        validator: (value) => value == null
                            ? 'Please select your blood group'
                            : null,
                        hint: Text('Blood Group'),
                        value: _bloodGroup == '' ? null : _bloodGroup,
                        items: _bloodGroups.map((e) {
                          return DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() => _bloodGroup = value);
                          print(_gender);
                        }),
                  ),
                ),
                const SizedBox(height: 30),

                const SizedBox(height: 30),
                FormField<bool>(
                  builder: (state) {
                    return Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Checkbox(
                                value: checkBoxValue,
                                onChanged: (value) {
                                  setState(() {
//save checkbox value to variable that store terms and notify form that state changed
                                    checkBoxValue = value;
                                    state.didChange(value);
                                  });
                                }),
                            Flexible(
                              child: Text(
                                  'I accept terms and conditions and subscribe to weekly E-mails'),
                            ),
                          ],
                        ),
//display error in matching theme
                        Text(
                          state.errorText ?? '',
                          style: TextStyle(
                            color: Theme.of(context).errorColor,
                          ),
                        )
                      ],
                    );
                  },
//output from validation will be displayed in state.errorText (above)
                  validator: (value) {
                    if (!checkBoxValue) {
                      return 'You need to accept terms';
                    } else {
                      return null;
                    }
                  },
                ),
                RoundedButton(
                  label: 'Submit',
                  bgColor: Colors.blue[600],
                  onPressed: () {
                    _submitButtonPressed(context);
                  },
                ),
                const SizedBox(height: 30),
                Container(
                  alignment: Alignment.center,
                  child: InkWell(
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                Text(
                  _error,
                  textAlign: TextAlign.center,
                ),
                //Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _submitButtonPressed(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      Map<String, dynamic> data = {
        'name': _name,
        'email': widget.user.email,
        'age': _age,
        'gender': _gender,
        'phoneNumber': _phoneNumber,
        'bloodGroup': _bloodGroup,
        'role': 'patient',
      };
      await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.user.uid)
          .set(data);
      await FirebaseFirestore.instance
          .collection('patients')
          .doc(widget.user.uid)
          .set(data);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PatientHome()));
    }
  }
}
