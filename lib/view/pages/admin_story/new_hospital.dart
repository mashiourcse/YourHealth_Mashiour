import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yourhealth/view/widgets/widgets.dart';

class AddNewHospital extends StatefulWidget {
  @override
  _AddNewHospitalState createState() => _AddNewHospitalState();
}

class _AddNewHospitalState extends State<AddNewHospital> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _normalBed = '';
  String _emergencyBed = '';
  String _pregnancyBed = '';
  String _childBed = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add New Hospital'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Add New Hospital',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                const SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    validator: (value) =>
                        value.isEmpty ? 'Please enter a hospital name' : null,
                    onChanged: (val) {
                      setState(() => _name = val);
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Hospital Name',
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    validator: (value) => value.isEmpty
                        ? 'Please enter number of normal beds'
                        : null,
                    onChanged: (val) {
                      setState(() => _normalBed = val);
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Number of Normal Beds',
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    validator: (value) => value.isEmpty
                        ? 'Please enter number of emergency beds'
                        : null,
                    onChanged: (val) {
                      setState(() => _emergencyBed = val);
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Number of Emergency Beds',
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    validator: (value) => value.isEmpty
                        ? 'Please enter number of pregnancy beds'
                        : null,
                    onChanged: (val) {
                      setState(() => _pregnancyBed = val);
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Number of Pregnancy Beds',
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    validator: (value) => value.isEmpty
                        ? 'Please enter number of child beds'
                        : null,
                    onChanged: (val) {
                      setState(() => _childBed = val);
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Number of Child Beds',
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Builder(builder: (BuildContext buttonContext) {
                  return RoundedButton(
                      label: 'Submit',
                      bgColor: Colors.blue,
                      onPressed: () async {
                        await _submitButtonPressed(buttonContext);
                      });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submitButtonPressed(BuildContext context1) async {
    if (_formKey.currentState.validate()) {
      DocumentReference doc =
          FirebaseFirestore.instance.collection('hospitals').doc();
      String hospitalId = doc.id;

      await FirebaseFirestore.instance
          .collection('hospitals')
          .doc(hospitalId)
          .set({
        'name': _name,
        'normalBeds': _normalBed,
        'emergencyBeds': _emergencyBed,
        'pregnancyBeds': _pregnancyBed,
        'childBeds': _childBed,
        'hospitalId': hospitalId,
      });
      Scaffold.of(context1).showSnackBar(SnackBar(
        content: Text('The hospital has been added to database'),
        onVisible: () async {
          await Future.delayed(Duration(seconds: 3));
          Navigator.pop(context);
        },
      ));
    }
  }
}
