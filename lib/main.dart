import 'package:breather/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:breather/constants/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: CustomColors.selago2),
      routes: ROUTES,
      debugShowCheckedModeBanner: false,
    );
  }
}
