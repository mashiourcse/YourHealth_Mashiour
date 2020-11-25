import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yourhealth/data/models/appointment.dart';
import 'package:yourhealth/data/services/auth_services.dart';

class AppointmentRequests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   // var appointmentListLength = FirebaseFirestore.instance.collection('appointments').doc(uid).snapshots().length;

    //print(appointmentListLength);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Appointment Requests'),
      ),
      body: StreamBuilder(
          stream: AuthenticationService().appointments(true),
          builder: (BuildContext context,
              AsyncSnapshot<List<Appointment>> snapshot) {
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
                        ],
                      ),
                      onTap: () {},
                    ),
                  );
                });
          }),
    );
  }
}
