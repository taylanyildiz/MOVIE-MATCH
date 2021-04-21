import 'package:flutter/material.dart';

class CustomBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBar({
    Key key,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
          border: Border(
        top: BorderSide(color: Colors.red, width: 3.0),
      )),
      tabs: icons
          .asMap()
          .map((key, value) => MapEntry(
              key,
              Tab(
                  icon: Icon(
                value,
                size: 40.0,
                color: key == selectedIndex ? Colors.red : Colors.white,
              ))))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
