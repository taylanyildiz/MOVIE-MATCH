import 'package:flutter/material.dart';
import 'package:movie_match_splash_screen/screens/screens.dart';
import 'package:movie_match_splash_screen/widgets/widgets.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final _screens = <Widget>[
    ProfileScreen(),
    Scaffold(),
    HomeScreen(),
    Scaffold(),
    Scaffold(),
  ];

  final _icons = <IconData>[
    Icons.person,
    Icons.connect_without_contact,
    Icons.home,
    Icons.notifications,
    Icons.settings,
  ];
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 2,
      length: _icons.length,
      child: Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: _screens,
        ),
        bottomNavigationBar: Container(
          color: Colors.black,
          padding: const EdgeInsets.only(bottom: 16.0),
          child: CustomBar(
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
          ),
        ),
      ),
    );
  }
}
