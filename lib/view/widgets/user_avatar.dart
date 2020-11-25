import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[400],
      ),
      child:   Image.asset(
        'assets/images/yhlogo.PNG',
        height: 80,

      ),
    );
  }
}

class UserAvatarCustomSize extends StatelessWidget {
  final double height, width;
  const UserAvatarCustomSize({this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[400],
      ),
      child: Icon(
        Icons.person,
        color: Colors.grey[900],
        size: 40,
      ),
    );
  }
}
