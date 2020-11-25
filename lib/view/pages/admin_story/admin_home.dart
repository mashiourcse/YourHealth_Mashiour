import 'package:flutter/material.dart';
import 'package:yourhealth/Product/screens/orders_screen.dart';
import 'package:yourhealth/Product/screens/user_products_screen.dart';
import 'package:yourhealth/data/services/auth_services.dart';
import 'package:yourhealth/view/pages/admin_story/doctor_list.dart';
import 'package:yourhealth/view/pages/admin_story/hospitals.dart';
import 'package:yourhealth/view/pages/admin_story/patients_list.dart';
import 'package:yourhealth/view/pages/admin_story/registered_doctors.dart';
import 'package:yourhealth/view/pages/auth_dashboard.dart';
import 'package:yourhealth/view/widgets/widgets.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Admin Home'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Header(),
              const SizedBox(height: 40),
              UserAvatar(),
              const SizedBox(height: 30),
              Text(
                "Admin Panel",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              const SizedBox(height: 30),
              RoundedButton(
                label: 'Doctors',
                bgColor: Colors.blue[600],
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DoctorList()));
                },
              ),
              const SizedBox(height: 30),
              RoundedButton(
                label: 'Patients',
                bgColor: Colors.blue[600],
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PatientList()));
                },
              ),
              const SizedBox(height: 30),
              RoundedButton(
                label: 'New Registered Doctors',
                bgColor: Colors.blue[600],
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisteredDoctorList()));
                },
              ),
              const SizedBox(height: 30),
              RoundedButton(
                label: 'Hospitals',
                bgColor: Colors.blue[600],
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HospitalList()));
                },
              ),
              const SizedBox(height: 30),
              RoundedButton(
                label: 'Manage Products',
                bgColor: Colors.blue[600],
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserProductsScreen()));
                },
              ),
              const SizedBox(height: 30),
              RoundedButton(
                label: 'Customer Order List',
                bgColor: Colors.blue[600],
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrdersScreen()));
                },
              ),
              const SizedBox(height: 30),
              RoundedButton(
                label: 'Log Out',
                bgColor: Colors.red[600],
                onPressed: () async {
                  await AuthenticationService().signOutUser();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AuthDashboardPage()),
                      (Route<dynamic> route) => false);
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
