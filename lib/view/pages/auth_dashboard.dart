import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yourhealth/view/pages/admin_story/admin_login.dart';
import 'package:yourhealth/view/pages/choose_usertype_register.dart';
import 'package:yourhealth/view/pages/login_page.dart';
import 'package:yourhealth/view/widgets/widgets.dart';

class AuthDashboardPage extends StatelessWidget {
  onSignPressed(BuildContext context) {
    print("Sign In Button Pressed");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  onRegisterPressed(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ChooseUserTypeRegister()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text('Your Health'),
        //   //backgroundColor: Colors.white,
        // ),
        body: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //const Spacer(),
                //Header(),
                const SizedBox(height: 40),
                Image.asset(
                  'assets/images/yourhealth_mainlogo.jpg',
                  height: 400,
                ),
                const SizedBox(height: 30),
                RoundedButton(
                  label: "Sign In",
                  bgColor: Colors.blue,
                  onPressed: () => onSignPressed(context),
                ),
                const SizedBox(height: 20),
                RoundedButton(
                  label: "Register",
                  bgColor: Colors.deepPurple,
                  onPressed: () => onRegisterPressed(context),
                ),
                const SizedBox(height: 20),
                RoundedButton(
                  label: "Admin Login",
                  bgColor: Colors.redAccent,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminLoginPage()));
                  },
                ),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
