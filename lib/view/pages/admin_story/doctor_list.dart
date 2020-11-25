import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yourhealth/data/models/doctor.dart';
import 'package:yourhealth/data/services/auth_services.dart';

class DoctorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Doctors'),
      ),
      body: StreamBuilder(
          stream: AuthenticationService().doctors,
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
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(Icons.timer),
                                      Flexible(
                                          child: Text(snapshot
                                              .data[index].visitingHour)),
                                    ],
                                  ),
                                ),
                                VerticalDivider(
                                  thickness: 2,
                                ),
                                Flexible(
                                    child:
                                        Text(snapshot.data[index].speciality)),
                                VerticalDivider(
                                  thickness: 2,
                                ),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_city),
                                      Flexible(
                                          child: Text(
                                              snapshot.data[index].location)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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

  _removeButtonTapped(BuildContext context, Doctor doctor) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(doctor.uid)
        .delete();
    await FirebaseFirestore.instance
        .collection('doctors')
        .doc(doctor.uid)
        .delete();

    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Doctor ${doctor.name} has been removed from database')));
  }
}
