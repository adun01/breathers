import 'package:auto_route/auto_route.dart';
import 'package:breather/constants/colors.dart';
import 'package:breather/constants/icons.dart';
import 'package:breather/models/hive_names.dart';
import 'package:breather/models/practice.dart';
import 'package:breather/routes/routes.gr.dart';
import 'package:breather/widgets/breathe-card.dart';
import 'package:breather/widgets/icon.dart';
import 'package:flutter/material.dart';
import 'package:breather/models/step-short.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:breather/locale_provider.dart';
import 'package:provider/provider.dart';

class BreatheListPage extends StatefulWidget {
  @override
  _BreatheListPage createState() => _BreatheListPage();
}

class _BreatheListPage extends State {
  final List<BreathersShortModel> steps = BreathersShortModel.getListMock();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LocaleProvider>(
        create: (_) => LocaleProvider(),
        builder: (context, child) {
          return SingleChildScrollView(
            child: Container(
              color: CustomColors.whiteLilac,
              child: Column(
                children: [
                  SafeArea(
                      child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          BreatheIcon(path: CustomIcons.stars),
                          Container(
                            margin: const EdgeInsets.only(top: 80, bottom: 22),
                            alignment: Alignment.center,
                            child: BreatheIcon(path: CustomIcons.flower),
                          )
                        ],
                      ),
                    ],
                  )),
                  Text(
                    AppLocalizations.of(context)?.meditations ?? '',
                    style: TextStyle(
                        fontFamily: 'PT-Serif',
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.black),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text(
                      AppLocalizations.of(context)?.hours_this_month ?? '',
                      style: TextStyle(
                          fontFamily: 'inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: CustomColors.lavender2),
                    ),
                  ),
                  ValueListenableBuilder(
                      valueListenable:
                          Hive.box<BreathePracticeModel>(HiveBoxes.practics)
                              .listenable(),
                      builder: (context, Box<BreathePracticeModel> box, _) {
                        return Padding(
                          padding: EdgeInsets.only(top: 23),
                          child: Column(
                            children: [
                              ...box.values.map(
                                  (BreathePracticeModel breathe) => BreatheCard(
                                      breathe: breathe,
                                      onTap: () {
                                        AutoRouter.of(context)
                                            .navigate(BrPageRouter(children: [
                                          BreathePracticPageRouter(
                                              id: breathe.key),
                                        ]));
                                      }))
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ),
          );
        });
  }
}
