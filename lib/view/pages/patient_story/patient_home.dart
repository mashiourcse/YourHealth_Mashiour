import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourhealth/Product/screens/products_overview_screen.dart';
import 'package:yourhealth/bmiCal/bmicalculator.dart';
import 'package:yourhealth/data/models/doctor.dart';
import 'package:yourhealth/data/services/api_services.dart';
import 'package:yourhealth/data/services/auth_services.dart';
import 'package:yourhealth/view/pages/patient_story/ambulance.dart';
import 'package:yourhealth/view/pages/patient_story/appointment_requests.dart';
import 'package:yourhealth/view/pages/patient_story/chat_with_doctor.dart';
import 'package:yourhealth/view/pages/patient_story/choose_department.dart';
import 'package:yourhealth/view/pages/patient_story/choose_quiz_language.dart';
import 'package:yourhealth/view/pages/patient_story/covid_local.dart';
import 'package:yourhealth/view/pages/patient_story/list_hospitals.dart';
import 'package:yourhealth/view/pages/patient_story/patient_accepted_appointments.dart';
import 'package:yourhealth/view/pages/patient_story/patient_appointments.dart';
import 'package:yourhealth/view/pages/patient_story/primary_screening.dart';
import 'package:yourhealth/view/pages/patient_story/quiz/quiz_page.dart';
import 'package:yourhealth/view/widgets/widgets.dart';
import 'appoinment_home_page.dart';

import '../../../data/./PatientHomeScreen/data/PatientHomescreenImage.dart';
import '../../../data/./PatientHomeScreen/config/styles.dart';
import '../../../data/./PatientHomeScreen/config/palette.dart';

class PatientHome extends StatefulWidget {
  @override
  _PatientHomeState createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {
  Map<String, double> _covidData = Map<String, double>();

  int _selectedIndex = 0;
  AuthenticationService _auth = AuthenticationService();
  bool _isDataLoaded = false;
  List<Color> _colorList = [
    Colors.blue,
    Colors.orange[700],
    Colors.red,
    Colors.green,
  ];
  ScrollController _scrollController;

  @override
  void initState() {
    _getData();
    //_scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Doctor>>.value(
      value: AuthenticationService().doctors,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Your Health Patient Home'),
          backgroundColor: Palette.primaryColor,
        ),
        resizeToAvoidBottomPadding: false,
        body: CustomScrollView(
          //physics: ClampingScrollPhysics(),
          slivers: <Widget>[
            _buildHeader(),
            _buildPreventionTips(),
            _buildYourOwnTest(), //five disease symptomps
            _buildapoinment(), //apoinmentHomepage
            _buildChat(), //chatwithappointedDoctors
            _buildHealthProduct(), //buyinghealthProducts
            _buildGlobalstats(), //corona status
            _buildCountryStats(),
            _buildbmihospitalambulance(), //bmihospitalambulance
            //countryStatus
          ],
        ),
        //bottomNavigationBar: ,

        bottomNavigationBar: BottomNavBar(currentIndex: 0),
      ),
    );
  }

  // void _onItemTapped(int index) {
  //   switch (index) {
  //     case 0:
  //       {
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => PatientHome()));
  //         break;
  //       }
  //     case 1:
  //       {
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (context) => PatientConversationPage()));
  //         break;
  //       }
  //     case 2:
  //       {
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => PatientHome()));
  //         break;
  //       }
  //     case 3:
  //       {
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => ProfilePage()));
  //         break;
  //       }
  //     default:
  //   }
  // }

  // void _logOutButtonPressed() async {
  //   await _auth.signOutUser();
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => AuthDashboardPage()));
  // }

  Future<void> _getData() async {
    _covidData = await ApiService.getGlobalStat();
    //_countryList = await ApiService.getCountryStat();
    // _countryList.forEach((e) {
    //   print(
    //       '${e.name}:  ${e.critical} ${e.deaths} ${e.recovered} ${e.active} ${e.image}');
    // });
    setState(() {
      _isDataLoaded = true;
    });
  }

  //New Build Method

  SliverToBoxAdapter _buildHeader() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'COVID-19',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Are you feeling sick?',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'If you feel sick with any COVID-19 symptoms, please check by corona symptomps cheaking',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton.icon(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChooseLanguage()));
                      },
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      icon: const Icon(
                        Icons.question_answer,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Corona Symptomps Checking',
                        style: Styles.buttonTextStyle,
                      ),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildPreventionTips() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Prevention Tips',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: prevention
                  .map((e) => Column(
                        children: <Widget>[
                          Image.asset(
                            e.keys.first,
                            height: 100,
                          ),
                          SizedBox(height: 15),
                          Text(
                            e.values.first,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildYourOwnTest() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.all(10.0),
        height: 150,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFAD9FE4), Palette.primaryColor],
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset(
              'assets/images/own_test.png',
              height: 100,
            ),
            FlatButton(
              color: Colors.black12,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrimaryScreeningPage()));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Primarily 5 Disease Symptoms Checking',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildapoinment() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.all(10.0),
        height: 150,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFAD9FE4), Palette.primaryColor],
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset(
              'assets/images/apoinment.jpg',
              height: 100,
            ),
            FlatButton(
              color: Colors.black12,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AppoinmentHomePage()));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Appointments',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildChat() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.all(10.0),
        height: 150,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFAD9FE4), Palette.primaryColor],
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset(
              'assets/images/chatwithdoctor.PNG',
              height: 100,
            ),
            FlatButton(
              color: Colors.black12,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatWithDoctor()));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Chats With Doctor',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildbmihospitalambulance() {
    return SliverToBoxAdapter(
        child: Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      padding: const EdgeInsets.all(10.0),
      height: 130,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFAD9FE4), Palette.primaryColor],
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: GridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0.8, vertical: 0.8),
            color: Palette.primaryColor,
            child: FlatButton(
              color: Colors.black12,
              child: Flexible(
                child: Column(
                  children: [
                    const Spacer(),
                    Icon(
                      Icons.calculate,
                      color: Colors.blue,
                      size: 24.0,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: Text("BMI & FITNESS",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
              onPressed: () {
                //Bmi
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Bmi()));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0.8, vertical: 0.8),
            color: Palette.primaryColor,
            child: FlatButton(
              color: Colors.black12,
              child: Flexible(
                child: Column(
                  children: [
                    const Spacer(),
                    Icon(
                      Icons.local_hospital,
                      color: Colors.blue,
                      size: 24.0,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                        child: Text("Hospital Info",
                            style: TextStyle(color: Colors.white))),
                    //const Spacer()
                  ],
                ),
              ),
              onPressed: () {
                //hospital
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Hospitals()));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0.7, vertical: 0.7),
            color: Palette.primaryColor,
            child: FlatButton(
              color: Colors.black12,
              child: Flexible(
                child: Column(
                  children: [
                    const Spacer(),
                    Icon(
                      Icons.phone,
                      color: Colors.blue,
                      size: 24.0,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.all(.05),
                      child: Text(
                        "Ambulance Numbers",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                    //const Spacer()
                  ],
                ),
              ),
              onPressed: () {
                //ambulance
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AmbulancePage()));
              },
            ),
          ),
        ],
      ),
    ));
  }

  SliverToBoxAdapter _buildHealthProduct() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.all(10.0),
        height: 150,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFAD9FE4), Palette.primaryColor],
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset(
              'assets/images/healthproduct.png',
              height: 100,
            ),
            FlatButton(
              color: Colors.black12,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductsOverviewScreen()));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Buy Health Products',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
// SliverToBoxAdapter _buildBmi() {
//   return SliverToBoxAdapter(
//     child: Center(
//       child: Image.network(
//         'https://www.graphicsprings.com/filestorage/stencils/dd2712afdf9dc36c4d4419792f62bf47.png?width=500&height=500',
//         height: 100,
//         width: 400,
//       ),
//     ),
//   );
// }

//buildGlobal Covid status
  SliverToBoxAdapter _buildGlobalstats() {
    return SliverToBoxAdapter(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: !_isDataLoaded
              ? Center(child: CircularProgressIndicator())
              : PieChartWidget(
                  label: 'Global Stats',
                  dataMap: _covidData,
                  colorList: _colorList,
                ),
        ),
      ),
    );
  }
//   SliverToBoxAdapter _buildloacalImage() {
//   return SliverToBoxAdapter(
//     child: Center(
//       child: Image.network(
//         'https://media.istockphoto.com/vectors/corona-virus-2019-prevention-infographic-vector-illustration-vector-id1216890008',
//         height: 300,
//         //width: 400,
//       ),
//     ),
//   );
// }
//build localCovid Status
  //SliverToBoxAdapter _buildCountryStats() {
  //   return SliverToBoxAdapter(
  //     child:   RoundedButton(
  //       label: 'Country Stats',
  //       bgColor:Palette.primaryColor,
  //       onPressed: () {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => CovidLocalStat()));
  //   },
  //   )
  //   );
  // }

  SliverToBoxAdapter _buildCountryStats() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.all(10.0),
        height: 150,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFAD9FE4), Palette.primaryColor],
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset(
              'assets/images/countrycovid.png',
              height: 50,
            ),
            FlatButton(
              color: Colors.black12,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CovidLocalStat()));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'See Country Status',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
