import 'package:breather/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:breather/constants/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: CustomColors.whiteLilac),
      routes: ROUTES,
      debugShowCheckedModeBanner: false,
    );
  }
}
