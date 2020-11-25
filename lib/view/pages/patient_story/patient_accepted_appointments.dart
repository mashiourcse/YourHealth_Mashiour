import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yourhealth/data/models/appointment.dart';
import 'package:yourhealth/data/services/auth_services.dart';

class ApprovedAppointments extends StatefulWidget {
  @override
  _ApprovedAppointmentsState createState() => _ApprovedAppointmentsState();
}

class _ApprovedAppointmentsState extends State<ApprovedAppointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Appointments'),
      ),
      body: StreamBuilder(
        stream: AuthenticationService().acceptedAppointments(true),
        builder:
            (BuildContext context, AsyncSnapshot<List<Appointment>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
            ));
          }
          // for (var doc in snapshot.data) {
          //   print(doc.patientName);
          //   print(doc.date);
          //   print(doc.time);
          //   print(doc.message);
          // }
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      size: 40,
                    ),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data[index].doctorName,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(snapshot.data[index].date),
                        Text(snapshot.data[index].time),
                        Text(snapshot.data[index].message),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          padding: EdgeInsets.all(1),
                          child: FlatButton(
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              _removeButtonPressed(snapshot.data[index]);
                            },
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                );
              });
        },
      ),
    );
  }

  _removeButtonPressed(Appointment appointment) async {
    await FirebaseFirestore.instance
        .collection('patients')
        .doc(appointment.patientId)
        .collection('appointments')
        .doc(appointment.appointmentId)
        .delete();
    await FirebaseFirestore.instance
        .collection('doctors')
        .doc(appointment.doctorId)
        .collection('appointments')
        .doc(appointment.appointmentId)
        .delete();
    print('done');
  }
}
