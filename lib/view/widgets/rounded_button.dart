import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String label;
  final Color bgColor;
  final Function onPressed;
  final Color fontColor;
  const RoundedButton(
      {Key key,
      @required this.label,
      this.fontColor = Colors.white,
      @required this.bgColor,
      @required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: const EdgeInsets.all(30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: onPressed,
      color: bgColor,
      child: Text(
        label,
        style: TextStyle(fontSize: 15, color: fontColor),
      ),
    );
  }
}
