import 'package:flutter/material.dart';
import 'package:yourhealth/view/pages/patient_story/patient_appointments.dart';
import 'package:yourhealth/view/widgets/header.dart';
import 'package:yourhealth/view/widgets/user_avatar.dart';

class ChooseDepartment extends StatefulWidget {
  @override
  _ChooseDepartmentState createState() => _ChooseDepartmentState();
}

class _ChooseDepartmentState extends State<ChooseDepartment> {
  List<String> _departments = [
    'Medicine',
    'Cardiology',
    'Gastroentorology',
    'ENT',
    'Gynee & OBS',
    'Nephrology',
    'Orthopedics',
    'Oncology',
    'Psychiatry',
    'Pediatrics',
    'Physical Medicine',
    'Skin and VD',
    'Surgery',
    'Urology'
  ];

  String _speciality = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Choose Department'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            //Header(),
            const SizedBox(height: 40),
            UserAvatar(),
            const SizedBox(height: 30),
            Text('Choose a department'),
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
                  validator: (value) =>
                      value == null ? 'Please select your department' : null,
                  hint: Text('Department'),
                  value: _speciality == '' ? null : _speciality,
                  items: _departments.map((e) {
                    return DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() => _speciality = value);
                    print(_speciality);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PatientAppointments(
                                  department: _speciality,
                                )));
                  },
                ),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
