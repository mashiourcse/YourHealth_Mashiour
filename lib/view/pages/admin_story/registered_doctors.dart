import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yourhealth/data/models/doctor.dart';
import 'package:yourhealth/data/services/auth_services.dart';

class RegisteredDoctorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Unverified Doctors'),
      ),
      body: StreamBuilder(
          stream: AuthenticationService().newDoctors,
          builder:
              (BuildContext context, AsyncSnapshot<List<Doctor>> snapshot) {
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

                  var x = snapshot.data[index].visitingHour;

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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.timer),
                                  Text(snapshot.data[index].visitingHour),
                                ],
                              ),
                              Text(snapshot.data[index].speciality),
                              Row(
                                children: [
                                  Icon(Icons.location_city),
                                  Text(snapshot.data[index].location),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RaisedButton(
                                  color: Colors.blue,
                                  child: Text('Approve',
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    _approveButtonTapped(
                                        context, snapshot.data[index]);
                                  }),
                              SizedBox(width: 20),
                              RaisedButton(
                                  color: Colors.blue,
                                  child: Text('Decline',
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    _removeButtonTapped(
                                        context, snapshot.data[index]);
                                  }),
                            ],
                          ),
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

  _removeButtonTapped(BuildContext context, Doctor doctor) async {
    await FirebaseFirestore.instance
        .collection('registeredDoctors')
        .doc(doctor.uid)
        .delete();
    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
            "Doctor ${doctor.name}'s registration request has been declined")));
  }

  _approveButtonTapped(BuildContext context, Doctor doctor) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(doctor.uid)
        .set({'isVerified': true}, SetOptions(merge: true));
    await FirebaseFirestore.instance
        .collection('doctors')
        .doc(doctor.uid)
        .set({'isVerified': true}, SetOptions(merge: true));
    await FirebaseFirestore.instance
        .collection('registeredDoctors')
        .doc(doctor.uid)
        .delete();

    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
            "Doctor ${doctor.name}'s registration request has been accepted")));
  }
}
