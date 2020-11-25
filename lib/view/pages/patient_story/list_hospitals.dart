import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yourhealth/data/models/hospital.dart';
import 'package:yourhealth/view/pages/patient_story/hospital_bed_info.dart';

class Hospitals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hospitals'),
      ),
      body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('hospitals').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: ListTile(
                        leading: Icon(
                          Icons.medical_services,
                          size: 40,
                        ),
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data.docs[index].data()['name'],
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        onTap: () {
                          Hospital hospital = Hospital(
                            name:
                                snapshot.data.docs[index].data()['name'] ?? '',
                            normal: snapshot.data.docs[index]
                                    .data()['normalBeds'] ??
                                '',
                            emergency: snapshot.data.docs[index]
                                    .data()['emergencyBeds'] ??
                                '',
                            pregnancy: snapshot.data.docs[index]
                                    .data()['pregnancyBeds'] ??
                                '',
                            child:
                                snapshot.data.docs[index].data()['childBeds'] ??
                                    '',
                            id: snapshot.data.docs[index]
                                    .data()['hospitalId'] ??
                                '',
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HospitalBedInfo(
                                        hospital: hospital,
                                      )));
                        },
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
