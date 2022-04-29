import 'package:breather/constants/colors.dart';
import 'package:breather/db/init.dart';
import 'package:breather/db/practic-step.dart';
import 'package:breather/db/practics.dart';
import 'package:breather/db/step-type.dart';
import 'package:breather/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  BreatheStepTypeAdapter.registerAdapter();
  BreatheDBPracticStep.registerAdapter();
  WidgetsFlutterBinding.ensureInitialized();
  await BreatheDB.init();
  await BreatheDBPractics.openBox();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        theme: ThemeData(scaffoldBackgroundColor: CustomColors.whiteLilac),
        debugShowCheckedModeBanner: false,
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate());
  }
}
