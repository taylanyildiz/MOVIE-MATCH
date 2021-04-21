import 'package:flutter/material.dart';
import 'package:movie_match_splash_screen/models/models.dart';

class CircleUser extends StatelessWidget {
  final User user;
  final Function onPressed;
  const CircleUser({Key key, @required this.user, @required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        radius: 22.0,
        backgroundColor: Colors.red,
        child: CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.grey,
          backgroundImage: AssetImage(user.user_photo_1),
        ),
      ),
    );
  }
}
