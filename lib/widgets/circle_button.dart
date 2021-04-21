import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final double iconSize;
  Color backgroundColor;
  CircleButton({
    Key key,
    Color backgroundColor,
    @required this.icon,
    @required this.onPressed,
    @required this.iconSize,
  })  : backgroundColor = backgroundColor ?? Colors.green[200],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      margin: const EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon),
        color: Colors.white,
        onPressed: onPressed,
        iconSize: 20,
      ),
    );
  }
}
