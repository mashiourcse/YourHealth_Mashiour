import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yourhealth/data/models/hospital.dart';
import 'package:yourhealth/view/widgets/widgets.dart';

class EditHospital extends StatefulWidget {
  final Hospital hospital;

  const EditHospital({Key key, this.hospital}) : super(key: key);

  @override
  _EditHospitalState createState() => _EditHospitalState();
}

class _EditHospitalState extends State<EditHospital> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _normalBed = '';
  String _emergencyBed = '';
  String _pregnancyBed = '';
  String _childBed = '';

  TextEditingController name = TextEditingController();
  TextEditingController normal = TextEditingController();
  TextEditingController pregnancy = TextEditingController();
  TextEditingController child = TextEditingController();
  TextEditingController emergency = TextEditingController();

  @override
  void initState() {
    super.initState();
    name.text = widget.hospital.name;
    normal.text = widget.hospital.normal;
    emergency.text = widget.hospital.emergency;
    pregnancy.text = widget.hospital.pregnancy;
    child.text = widget.hospital.child;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Edit Hospital'),
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
                  'Edit information for ${widget.hospital.name}',
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
                    controller: name,
                    //initialValue: widget.hospital.name,
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
                    controller: normal,
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
                    controller: emergency,
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
                    controller: pregnancy,
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
                    controller: child,
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
      await FirebaseFirestore.instance
          .collection('hospitals')
          .doc(widget.hospital.id)
          .set({
        'name': name.text,
        'normalBeds': normal.text,
        'emergencyBeds': emergency.text,
        'pregnancyBeds': pregnancy.text,
        'childBeds': child.text,
      }, SetOptions(merge: true));
      Scaffold.of(context1).showSnackBar(SnackBar(
        content: Text('Information has been updated'),
        onVisible: () async {
          await Future.delayed(Duration(seconds: 3));
          Navigator.pop(context);
        },
      ));
    }
  }
}
