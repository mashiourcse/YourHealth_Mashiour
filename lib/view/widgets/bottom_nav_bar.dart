import 'package:flutter/material.dart';
import 'package:yourhealth/Product/screens/products_overview_screen.dart';
import 'package:yourhealth/view/pages/patient_story/conversation.dart';
import 'package:yourhealth/view/pages/patient_story/patient_home.dart';
import 'package:yourhealth/view/pages/patient_story/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  BottomNavBar({this.currentIndex});
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<BottomNavigationBarItem> bottomBarItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        color: Colors.deepPurple,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.email, color:Colors.deepPurple),
      label: 'Conversation',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart, color: Colors.deepPurple),
      label: 'Buy Health Products',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person, color:Colors.deepPurple),
      label: 'User',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: bottomBarItems,
      selectedItemColor: Colors.deepPurple,
      currentIndex: widget.currentIndex,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PatientHome()));
          break;
        }
      case 1:
        {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PatientConversationPage()));
          break;
        }
      case 2:
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProductsOverviewScreen()));
          break;
        }
      case 3:
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProfilePage()));
          break;
        }
      default:
    }
  }
}
