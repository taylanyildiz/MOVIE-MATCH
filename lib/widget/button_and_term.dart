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
  Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 1.0, end: .96).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      child: Container(
        width: 400.0,
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
            SizedBox(height: 30.0),
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
            Spacer(),
            _TermOfUse(),
            SizedBox(height: 10.0),
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
          fontSize: 14.0,
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
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
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
