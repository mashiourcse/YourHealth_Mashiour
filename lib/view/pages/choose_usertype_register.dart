import 'package:flutter/material.dart';
import 'package:yourhealth/view/pages/register_doctor.dart';
import 'package:yourhealth/view/pages/register_page.dart';
import 'package:yourhealth/view/widgets/widgets.dart';

class ChooseUserTypeRegister extends StatefulWidget {
  @override
  _ChooseUserTypeRegisterState createState() => _ChooseUserTypeRegisterState();
}

class _ChooseUserTypeRegisterState extends State<ChooseUserTypeRegister> {
  onTypeSelect(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                _selectedUserType == 0 ? SignUpPage() : SignUpDoctorPage()));
  }

  Color dropDownColor = Colors.black;

  int _selectedUserType;
  List<DropdownMenuItem<int>> userList = [
    DropdownMenuItem(value: 0, child: Text("Patient")),
    DropdownMenuItem(value: 1, child: Text("Doctor")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Health',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Container(

        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              //Header(),
              const SizedBox(height: 40),
              //UserAvatar(),
              Image.asset(
                'assets/images/yhlogo.PNG',
                height: 150,

              ),
              Text('Choose User Type',style: TextStyle(fontSize: 20,color: Colors.deepPurple),),
              const SizedBox(height: 30),
              Form(
                child: Expanded(
                  child: ListView(
                    children: _getFormWidget(),
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getFormWidget() {
    List<Widget> formWidget = List();

    formWidget.add(Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Text("Select User Type"),
          items: userList,
          value: _selectedUserType,
          onChanged: (value) {
            setState(() {
              _selectedUserType = value;
            });
            onTypeSelect(context);
          },
          isExpanded: true,
        ),
      ),
    ));
    return formWidget;
  }
}
