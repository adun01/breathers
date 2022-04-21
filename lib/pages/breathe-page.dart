import 'package:breather/constants/colors.dart';
import 'package:breather/widgets/header.dart';
import 'package:flutter/material.dart';

import 'package:breather/models/breathes.dart';
import 'package:breather/widgets/breathe.dart';
import 'package:breather/models/steps-indicator.dart';

import '../constants/routes.dart';

class BreathePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as BreathersShortModel;
    return Scaffold(
        body: Column(
      children: [
        Header(),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 32, bottom: 10),
                alignment: Alignment.center,
                child: Text(
                  'Be ready',
                  style: TextStyle(
                      color: CustomColors.balticSea,
                      height: 1.28,
                      fontFamily: 'PT-Serif',
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shadowColor: CustomColors.transparent,
                    minimumSize: Size(120, 33),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    primary: CustomColors.selago,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.zero),
                onPressed: () {},
                child: const Text(
                  'PRESS START',
                  style: TextStyle(
                      color: CustomColors.lavender2,
                      fontFamily: 'inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Breathe(),
              )
            ],
          ),
        )
      ],
    )
        // body: Container(
        //   alignment: Alignment.center,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [Breathe(StepsIndicator.StepsIndicatorMock(args.id))],
        //       )
        //     ],
        //   ),
        // ),
        // persistentFooterButtons: [
        //   ElevatedButton(
        //     onPressed: () {
        //       navigatorPushNames(context, RoutesPath.routeBreatherEdit, args);
        //     },
        //     child: Text('edit'),
        //   ),
        //   ElevatedButton(
        //     onPressed: () {
        //       navigatorPushNames(context, RoutesPath.routeMain, null);
        //     },
        //     child: Text('back'),
        //   )
        // ],
        );
  }
}
