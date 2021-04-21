import 'package:cf_indicator/cf_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movie_match_splash_screen/data/data.dart';

class ProfileScreen extends StatelessWidget {
  Widget _displayProfileWidget(context, index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      width: double.infinity,
      height: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(
          profile[index],
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  final profile = <String>[
    currentUser.user_photo_1,
    currentUser.user_photo_2,
    currentUser.user_photo_3,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF201D1D),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 400.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: PageIndicator(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  // indicator: Indicator(
                  //   indicatorColor: Colors.red,
                  //   indicatorBackColor: Colors.white,
                  //   radius: 8.0,
                  // ),
                  onPageChanged: (page) => print(page),
                  page: profile.length,
                  builder: (context, index) =>
                      _displayProfileWidget(context, index),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                      offset: Offset(0.0, 5.0),
                    )
                  ]),
              child: Column(
                children: [
                  Icon(
                    Icons.message,
                    color: Colors.black,
                  ),
                  Text(
                    '12',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            VerticalDivider(width: 8.0),
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                      offset: Offset(0.0, 5.0),
                    )
                  ]),
              child: Column(
                children: [
                  Icon(
                    Icons.message,
                    color: Colors.black,
                  ),
                  Text(
                    '12',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            VerticalDivider(width: 8.0),
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                      offset: Offset(0.0, 5.0),
                    )
                  ]),
              child: Column(
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                  ),
                  Text(
                    '12',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ])
        ],
      ),
    );
  }
}
