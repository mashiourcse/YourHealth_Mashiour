import 'package:flutter/material.dart';
import 'package:yourhealth/data/services/auth_services.dart';
import 'package:yourhealth/view/email_confirm.dart';

import '../widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthenticationService auth = AuthenticationService();
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _confirmPass = '';
  String _name = '';
  String _gender = '';
  String _age = '';
  String _phoneNumber = '';
  String _bloodGroup = '';
  String _error = '';
  String _role = '';
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
      appBar: AppBar(
        title: Text('Register As Patient',style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepPurple,
      ),
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
                        ),
                      ),
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
                Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    validator: (value) =>
                        value != _password ? "The Passwords don't match" : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => _confirmPass = val);
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Re-enter Password',
                    ),
                  ),
                ),
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
                                  'I accept terms and conditions.'),
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
                  label: 'Sign Up',
                  bgColor: Colors.blue[600],
                  onPressed: () {
                    _signUpButtonPressed(context);
                  },
                ),
                const SizedBox(height: 30),

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

  _signUpButtonPressed(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      Map<String, dynamic> data = {
        'name': _name,
        'age': _age,
        'gender': _gender,
        'phoneNumber': _phoneNumber,
        'bloodGroup': _bloodGroup,
        'role': 'patient',
        'email': _email,
        'password': _password,
      };
      dynamic result = await auth.signUpNewPatient(data);

      if (result == null) {
        setState(() => _error = 'Something went wrong!');
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => VerifyEmail(type: true)));
      }
    }
  }
}
