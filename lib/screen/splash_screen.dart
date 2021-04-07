import 'dart:async';
import 'package:flutter/material.dart';
import 'package:welcome_screen_test/screen/screen.dart';
import 'package:welcome_screen_test/src/src.dart';

class SpashScreen extends StatefulWidget {
  @override
  _SpashScreenState createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen> {
  @override
  void initState() {
    super.initState();
    // var timer = Timer.periodic(Duration(seconds: 3), (timer) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => WelcomeScreen()),
    //   );
    //   timer.cancel();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return _MovieBackground();
  }
}

class _MovieBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 5.0,
        ),
        padding: EdgeInsets.all(5.0),
        itemCount: movieImage.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Hero(
              tag: '${index}',
              child: Image.asset(
                movieImage[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
