import 'package:breather/constants/colors.dart';
import 'package:breather/constants/icons.dart';
import 'package:breather/constants/routes.dart';
import 'package:breather/widgets/icon.dart';
import 'package:flutter/material.dart';

Color getColor(bool isActive) {
  return isActive ? CustomColors.amethyst : CustomColors.lavender;
}

TextStyle getTextStyle(bool isActive) {
  return TextStyle(
    color: getColor(isActive),
    fontFamily: 'Commissioner',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.03,
  );
}

class BreBottomNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BreBottomNavigationBar();
  }
}

class NavigationItem {
  String icon;
  String label;
  NavigationItem({required this.icon, required this.label});

  void onPressed(BuildContext context) {
    if (label == 'Home') {
      navigatorPushNames(context, RoutesPath.routeMain, null);
    }
  }
}

class _BreBottomNavigationBar extends State {
  int selectedIndex = 0;
  List<NavigationItem> items = [
    NavigationItem(icon: CustomIcons.home, label: 'Home'),
    NavigationItem(icon: CustomIcons.profile, label: 'Profile'),
    NavigationItem(icon: CustomIcons.settings, label: 'Settings'),
  ];
  void setSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.white.withOpacity(0.5),
      child: SafeArea(
        child: Container(
            padding: EdgeInsets.only(top: 8),
            height: 64,
            child: Row(children: <Widget>[
              ...items.asMap().entries.map(
                (item) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setSelectedIndex(item.key);
                        item.value.onPressed(context);
                      },
                      child: Container(
                        color: CustomColors.white.withOpacity(0.5),
                        child: Column(
                          children: [
                            BreIcon(
                                path: item.value.icon,
                                color: getColor(selectedIndex == item.key)),
                            Text(item.value.label,
                                style: getTextStyle(selectedIndex == item.key))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ])),
      ),
    );
  }
}
