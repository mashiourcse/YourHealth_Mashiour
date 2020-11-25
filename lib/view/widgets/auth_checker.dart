import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourhealth/view/pages/auth_dashboard.dart';
import 'package:yourhealth/view/pages/loading_screen.dart';

class AuthChecker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print('This User is: $user');
    if (user == null) {
      return AuthDashboardPage();
    } else {
      return LoadingScreen(user: user);
    }
  }
}
