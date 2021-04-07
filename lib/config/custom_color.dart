import 'package:flutter/cupertino.dart';

class CustomColor {
  static LinearGradient backgroundColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.center,
    colors: [
      Color(0xFFFFFFFF).withOpacity(.31),
      Color(0xFF4B4242).withOpacity(.81),
      Color(0xFF000000).withOpacity(.98),
    ],
  );
  static Color bottomButtonBack = const Color(0xFF0D0D0D);
}
