import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:welcome_screen_test/config/config.dart';

class ButtonandTerm extends StatefulWidget {
  @override
  _ButtonandTermState createState() => _ButtonandTermState();
}

class _ButtonandTermState extends State<ButtonandTerm>
    with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _controller2;
  Animation<double> _animation2;
  Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..forward();
    _animation = Tween<double>(begin: 1.0, end: .96).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
    _animation2 = Tween<double>(begin: -300.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: Curves.elasticOut,
      ),
    );
    _animation2.addListener(() {
      Future.delayed(
        Duration(seconds: 2),
        () => setState(() {}),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _controller2.dispose();
  }

  Widget _customButton(child) {
    return Transform.scale(
      scale: _animation.value,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 60.0),
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 15.0),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Image.asset(
                'assets/images/netflix.png',
                width: 30.0,
              ),
            ),
            SizedBox(width: 20.0),
            Text(
              'Netflix ile bağlan',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    _controller.dispose();
    _controller2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 100),
      bottom: _animation2.value,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 250.0,
        decoration: BoxDecoration(
          color: CustomColor.bottomButtonBack,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(44.0),
            topRight: Radius.circular(44.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 1),
            GestureDetector(
              onTap: () async {
                await _controller.forward();
                _controller.reverse();
              },
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) => _customButton(child),
              ),
            ),
            Spacer(flex: 2),
            _TermOfUse(),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

class _TermOfUse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "Bağlandığınız zaman gizlilik sözleşmesini ve ",
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.0,
        ),
        children: [
          TextSpan(
            text: 'Kullanım\nŞartlarını',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              decoration: TextDecoration.underline,
              decorationThickness: 2.0,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('şartlar');
              },
          ),
          TextSpan(
            text: " kabul etmiş olursunuz. ",
          ),
          TextSpan(
            text: 'Netflix kullanım\nhakkında',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              decoration: TextDecoration.underline,
              decorationThickness: 2.0,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('netflix bilgi');
              },
          ),
          TextSpan(
            text: " bilgi al",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
