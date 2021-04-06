import 'dart:math';

import 'package:flutter/material.dart';
import 'package:welcome_screen_test/src/src.dart';

class MovieBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -100.0,
      child: Container(
        height: 600,
        width: 600,
        child: Transform.rotate(
          angle: pi / 6,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: 1 / 1.3,
            ),
            padding: EdgeInsets.all(5.0),
            itemCount: movieImage.length,
            itemBuilder: (context, index) {
              return Card(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    movieImage[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
