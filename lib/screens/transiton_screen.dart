import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_match_splash_screen/screens/profile_screen.dart';
import 'package:movie_match_splash_screen/widgets/widgets.dart';

class TranstionScreen extends StatefulWidget {
  @override
  _TranstionScreenState createState() => _TranstionScreenState();
}

class _TranstionScreenState extends State<TranstionScreen>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  var time;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat();
    animation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: controller, curve: Curves.bounceOut),
    );
    time = Timer.periodic(Duration(seconds: 3), (time) {
      controller.stop();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProfileScreen()));
      time.cancel();
    });
    animation.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          MovieBackground(),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFFBFB).withOpacity(.64),
                  Color(0xFF000000).withOpacity(.87),
                  Color(0xFF000000).withOpacity(1.0),
                ],
              ),
            ),
          ),
          Center(
            child: Transform.scale(
              scale: animation.value,
              child: Container(
                width: 150.0,
                height: 150.0,
                child: Stack(
                  children: [
                    Container(
                      width: 150.0,
                      height: 150.0,
                      child: CustomPaint(
                        painter: LogoPaint(
                          offset: 1.0,
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: 0.2,
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 150.0,
                        height: 150.0,
                        child: CustomPaint(
                          painter: LogoPaint(
                            offset: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
