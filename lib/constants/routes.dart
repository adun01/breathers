import 'package:breather/pixelPerfect.dart';
import 'package:flutter/material.dart';

import 'package:breather/pages/breathe-edit-page.dart';
import 'package:breather/pages/breathe-page.dart';
import 'package:breather/pages/main-page.dart';

const routePathMain = '/';
const routePathBreather = '/breather';
const routePathBreatherEdit = '/breather/edit';

class RoutesPath {
  static String get routeMain => routePathMain;
  static String get routeBreather => routePathBreather;
  static String get routeBreatherEdit => routePathBreatherEdit;
}

final ROUTES = {
  routePathMain: (context) => MainPage(),
  routePathBreather: (context) => PixelPerfectScreen(BreathePage()),
  routePathBreatherEdit: (context) => BreatheEditPage(),
};

final navigatorPushNames =
    (BuildContext context, String path, Object? arguments) {
  Navigator.pushNamed(context, path, arguments: arguments);
};
