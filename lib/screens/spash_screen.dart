import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_match_splash_screen/widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  //
  AnimationController _controller;
  AnimationController _controller2;
  AnimationController _controller3;
  AnimationController _controller4;
  Animation<double> _animEnd;
  Animation<double> _animbackground;
  Animation<double> _animLogo, _animLogo2, _animLogo3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _controller3 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );

    _controller4 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _controller.forward().whenComplete(() => _controller4
        .forward()
        .whenComplete(() =>
            _controller2.forward().whenComplete(() => _controller3.forward())));

    _animbackground = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: Curves.easeOutExpo,
      ),
    );
    _animLogo = Tween<double>(begin: 0.0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );

    _animLogo.addListener(() {
      setState(() {});
    });
    _animLogo2 = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: Curves.easeInQuart,
      ),
    );
    _animLogo2.addListener(() {
      setState(() {});
    });
    _animLogo3 = Tween<double>(begin: 0.0, end: 0.2).animate(
      CurvedAnimation(parent: _controller4, curve: Curves.elasticOut),
    );
    _animLogo3.addListener(() {
      setState(() {});
    });

    _animEnd = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller3,
        curve: Curves.elasticOut,
      ),
    );
    _animEnd.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            MovieBackground(),
            //ShaderMask
            FadeTransition(
              opacity: _animbackground,
              child: Container(
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
            ),
            //Logo and Animation
            Center(
              child: Transform.scale(
                scale: _animLogo2.value,
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
                            offset: _animLogo.value,
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: _animLogo3.value,
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 150.0,
                          height: 150.0,
                          child: CustomPaint(
                            painter: LogoPaint(
                              offset: _animLogo.value,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //Indicator
            Transform.scale(
              scale: _animEnd.value,
              child: Center(
                child: TextPageIndicator(),
              ),
            ),
            //Button and Term
            Positioned(
              bottom: 0.0,
              child: Transform.scale(
                scale: _animEnd.value,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 270.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60.0),
                      topRight: Radius.circular(60.0),
                    ),
                    color: Colors.black,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20.0),
                      ButtonNetflix(),
                      Spacer(),
                      TermOfUse(),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
