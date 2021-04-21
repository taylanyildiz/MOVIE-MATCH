import 'package:flutter/material.dart';

class LiveUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(.4),
              blurRadius: 2.0,
              offset: Offset(0.0, 8.0),
            ),
          ]),
      child: Column(
        children: [
          SizedBox(height: 20.0),
          Text(
            'Kime Ne izliyor merak ediyor musun?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Icon(
            Icons.movie,
            size: 40.0,
          ),
        ],
      ),
    );
  }
}
