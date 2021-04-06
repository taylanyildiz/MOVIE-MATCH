import 'package:flutter/material.dart';
import 'package:welcome_screen_test/config/config.dart';
import 'package:welcome_screen_test/modal/modal.dart';
import 'package:welcome_screen_test/widget/widget.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black.withOpacity(.3),
      body: Stack(
        children: [
          MovieBackground(),
          _BackgroundColor(),
          _TextPageIndicator(),
          ButtonandTerm(),
        ],
      ),
    );
  }
}

class _BackgroundColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: CustomColor.backgroundColor,
      ),
    );
  }
}

class _TextPageIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextPageIndicator(
      indicatorColor: Colors.red,
      indicatorBackgroundColor: Colors.white,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                welComeHeadText[index],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                welComeBodyText[index],
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ],
          ),
        );
      },
    );
  }
}
