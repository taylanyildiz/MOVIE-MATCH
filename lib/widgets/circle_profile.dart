import 'package:flutter/material.dart';
import 'package:movie_match_splash_screen/models/models.dart';

// ignore: must_be_immutable
class CircleProfile extends StatelessWidget {
  final User user;
  final Function onPressed;
  final double radius;
  final double fontSize;
  bool isColumn;
  double padding;
  CircleProfile({
    Key key,
    this.padding,
    this.radius,
    this.isColumn = true,
    @required this.user,
    @required this.onPressed,
    this.fontSize,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding ?? 5.0),
      child: isColumn
          ? Column(
              children: [
                InkWell(
                  onTap: onPressed,
                  child: CircleAvatar(
                    radius: radius ?? 30.0,
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage(user.user_photo_1),
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  user.user_realname,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize ?? 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          : InkWell(
              onTap: onPressed,
              child: CircleAvatar(
                radius: radius ?? 30.0,
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage(user.user_photo_1),
              ),
            ),
    );
  }
}
