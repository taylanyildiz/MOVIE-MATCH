import 'package:flutter/cupertino.dart';

class CustomColor {
  static LinearGradient backgroundColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFFFFFF).withOpacity(.66),
      Color(0xFFFFFFFF).withOpacity(.3),
      Color(0xFF212020).withOpacity(.80),
      Color(0xFF212020).withOpacity(.80),
      Color(0xFF000000).withOpacity(.94),
    ],
  );
  static const Color bottomButtonBack = const Color(0xFF2A2626);
}
