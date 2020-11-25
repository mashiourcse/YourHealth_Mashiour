import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Your Health",
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
    );
  }
}
