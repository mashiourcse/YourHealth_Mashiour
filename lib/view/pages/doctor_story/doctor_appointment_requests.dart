import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yourhealth/data/models/appointment.dart';
import 'package:yourhealth/data/services/auth_services.dart';

class DoctorAppointmentRequests extends StatefulWidget {

  // number of appointments
  // starting time and ending time
  // fixed 20 minutes for everypatient | constant



  @override
  _DoctorAppointmentRequestsState createState() => _DoctorAppointmentRequestsState();
}

class _DoctorAppointmentRequestsState extends State<DoctorAppointmentRequests> {
  var appointmentListLength;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   AuthenticationService().acceptedAppointments(false).last.then((value) {
     setState(() {
       appointmentListLength = value.length;
       print(value);
     });
   });

  }
  @override
  Widget build(BuildContext context) {



    print(appointmentListLength);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Appointment Requests'),
      ),
      body: StreamBuilder(
          stream: AuthenticationService().appointments(false),
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
           // print(snapshot.data.length);

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
                            snapshot.data[index].patientName,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(snapshot.data[index].date),
                          Text(snapshot.data[index].time),
                          Text(snapshot.data[index].message),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.library_add_check,
                                  ),
                                  onPressed: () {
                                    _onAcceptButtonPressed(
                                        context, snapshot.data[index]);
                                  }),
                              SizedBox(width: 50),
                              IconButton(
                                  icon: Icon(Icons.cancel),
                                  onPressed: () {
                                    _onRejectButtonPressed(
                                        context, snapshot.data[index]);
                                  }),
                            ],
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  );
                });
          }),
    );
  }

  _onAcceptButtonPressed(BuildContext context, Appointment appointment) async {
    // print("Doctor ID: ${appointment.doctorId}");
    // Stream<QuerySnapshot> snapshot = FirebaseFirestore.instance
    //     .collection("doctors")
    //     .doc(appointment.doctorId)
    //     .collection("appointments")
    //     .snapshots();
    // ;
    //print("Snapshot: ${snapshot}");
    Map<String, dynamic> data = {
      'patientName': appointment.patientName,
      'doctorName': appointment.doctorName,
      'date': appointment.date,
      'time': appointment.time,
      'message': appointment.message,
      'patientId': appointment.patientId,
      'doctorId': appointment.doctorId,
      'appointmentId': appointment.appointmentId,
    };
    await FirebaseFirestore.instance
        .collection('patients')
        .doc(appointment.patientId)
        .collection('appointments')
        .doc(appointment.appointmentId)
        .set(data);
    await FirebaseFirestore.instance
        .collection('doctors')
        .doc(appointment.doctorId)
        .collection('appointments')
        .doc(appointment.appointmentId)
        .set(data);
    await FirebaseFirestore.instance
        .collection('patients')
        .doc(appointment.patientId)
        .collection('pendingAppointments')
        .doc(appointment.appointmentId)
        .delete();
    await FirebaseFirestore.instance
        .collection('doctors')
        .doc(appointment.doctorId)
        .collection('pendingAppointments')
        .doc(appointment.appointmentId)
        .delete();
  }

  _onRejectButtonPressed(BuildContext context, Appointment appointment) async {
    await FirebaseFirestore.instance
        .collection('patients')
        .doc(appointment.patientId)
        .collection('pendingAppointments')
        .doc(appointment.appointmentId)
        .delete();
    await FirebaseFirestore.instance
        .collection('doctors')
        .doc(appointment.doctorId)
        .collection('pendingAppointments')
        .doc(appointment.appointmentId)
        .delete();
  }
}
