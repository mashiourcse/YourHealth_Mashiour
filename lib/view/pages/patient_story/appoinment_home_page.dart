import 'package:flutter/material.dart';
import 'package:yourhealth/view/pages/patient_story/patient_accepted_appointments.dart';
import 'package:yourhealth/view/widgets/widgets.dart';
import 'appointment_requests.dart';
import 'choose_department.dart';

class AppoinmentHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Appoinments'),
      ),
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(

        child: Container(
          padding:
          const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/apoinment.jpg',
                height: 300,

              ),
              RoundedButton(
                label: 'Make an Appointment',
                bgColor: Colors.deepPurple,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChooseDepartment()));
                },
              ),
              SizedBox(height: 20),
              RoundedButton(
                label: 'Requested Appointments',
                bgColor: Colors.deepPurple,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppointmentRequests()));
                },
              ),
              SizedBox(height: 20),
              RoundedButton(
                label: 'Your Appointments',
                bgColor: Colors.deepPurple,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ApprovedAppointments()));
                },
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
}

