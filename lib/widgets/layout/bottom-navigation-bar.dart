import 'package:auto_route/auto_route.dart';
import 'package:breather/constants/colors.dart';
import 'package:breather/constants/icons.dart';
import 'package:breather/routes/routes.gr.dart';
import 'package:breather/widgets/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

class BreatheBottomNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BreatheBottomNavigationBar();
  }
}

class NavigationItem {
  String icon;
  Function getLabel;
  PageRouteInfo? route;
  NavigationItem({required this.icon, required this.getLabel, this.route});
}

class _BreatheBottomNavigationBar extends State {
  int selectedIndex = 0;
  List<NavigationItem> items = [
    NavigationItem(
        icon: CustomIcons.home,
        getLabel: (BuildContext context) {
          return AppLocalizations.of(context)?.home;
        },
        route: ListPageRouter()
    ),
    NavigationItem(
        icon: CustomIcons.profile,
        getLabel: (BuildContext context) {
          return AppLocalizations.of(context)?.profile;
        },
    ),
    NavigationItem(
        icon: CustomIcons.settings,
        getLabel: (BuildContext context) {
          return AppLocalizations.of(context)?.settings;
        }
    ),
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
                        final route = item.value.route ?? null;
                        if (route != null) {
                          AutoRouter.of(context).navigate(route);
                          setSelectedIndex(item.key);
                        }
                      },
                      child: Container(
                        color: CustomColors.white.withOpacity(0.5),
                        child: Column(
                          children: [
                            BreatheIcon(
                                path: item.value.icon,
                                color: getColor(selectedIndex == item.key)),
                            Text(
                                item.value.getLabel(context),
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
