import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yourhealth/data/models/user.dart';
import 'package:yourhealth/data/services/auth_services.dart';

class PatientList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Patients'),
      ),
      body: StreamBuilder(
          stream: AuthenticationService().patientList,
          builder:
              (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ));
            }
            // for (var doc in snapshot.data) {
            //   print(doc.name);
            //   print(doc.uid);
            //   print(doc.speciality);
            // }
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        size: 40,
                      ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data[index].name,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          RaisedButton(
                              color: Colors.blue,
                              child: Text('Remove',
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                _removeButtonTapped(
                                    context, snapshot.data[index]);
                              })
                        ],
                      ),
                      onTap: () {
                        //_listTileTapped(context, snapshot.data[index]);
                      },
                    ),
                  );
                });
          }),
    );
  }

  _removeButtonTapped(BuildContext context, UserModel patient) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(patient.uid)
        .delete();
    await FirebaseFirestore.instance
        .collection('patients')
        .doc(patient.uid)
        .delete();

    Scaffold.of(context).showSnackBar(SnackBar(
        content:
            Text('Patient ${patient.name} has been removed from database')));
  }
}
