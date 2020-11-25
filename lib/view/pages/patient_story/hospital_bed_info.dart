import 'package:flutter/material.dart';
import 'package:yourhealth/data/models/hospital.dart';

class HospitalBedInfo extends StatelessWidget {
  final Hospital hospital;

  const HospitalBedInfo({Key key, this.hospital}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${hospital.name}'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              Icon(
                Icons.local_hospital_rounded,
                color: Colors.blueAccent,
                size: 100,
              ),
              Text(
                hospital.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              const SizedBox(height: 80),
              InfoWidget(
                fieldName: 'Hospital Name',
                fieldData: hospital.name,
              ),
              const SizedBox(height: 30),
              InfoWidget(
                fieldName: 'Normal Beds',
                fieldData: hospital.normal,
              ),
              const SizedBox(height: 30),
              InfoWidget(
                  fieldName: 'Emergency Beds', fieldData: hospital.emergency),
              const SizedBox(height: 30),
              InfoWidget(
                fieldName: 'Pregnancy Beds',
                fieldData: hospital.pregnancy,
              ),
              const SizedBox(height: 30),
              InfoWidget(
                fieldName: 'Child Beds',
                fieldData: hospital.child,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  final String fieldName;
  final String fieldData;

  InfoWidget({this.fieldData, this.fieldName});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(fieldName,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(fieldData,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              )),
          Divider(),
        ],
      ),
    );
  }
}
