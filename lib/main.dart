import 'package:breather/constants/colors.dart';
import 'package:breather/db/init.dart';
import 'package:breather/db/practic-step.dart';
import 'package:breather/db/practics.dart';
import 'package:breather/db/step-type.dart';
import 'package:breather/l10n/all_locales.dart';
import 'package:breather/locale_provider.dart';
import 'package:breather/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    return ChangeNotifierProvider<LocaleProvider>(
        create: (_) => LocaleProvider(),
        builder: (context, child) {
          return MaterialApp.router(
              supportedLocales: AllLocales.all,
              locale: Provider.of<LocaleProvider>(context)
                  .locale, // if its null it will equal to first locale of supportedLocales
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              theme:
                  ThemeData(scaffoldBackgroundColor: CustomColors.whiteLilac),
              debugShowCheckedModeBanner: false,
              routeInformationParser: _appRouter.defaultRouteParser(),
              routerDelegate: _appRouter.delegate());
        });
  }
}
