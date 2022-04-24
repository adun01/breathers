import 'package:breather/constants/colors.dart';
import 'package:breather/constants/icons.dart';
import 'package:breather/widgets/icon.dart';
import 'package:breather/widgets/label.dart';
import 'package:breather/widgets/layout/layout-page.dart';
import 'package:flutter/material.dart';

import 'package:breather/constants/routes.dart';
import 'package:breather/models/breathes.dart';

class MainPage extends StatelessWidget {
  final List<BreathersShortModel> steps = BreathersShortModel.getListMock();

  @override
  Widget build(BuildContext context) {
    return BreLayoutPage(
      customHeader: Container(
        color: CustomColors.whiteLilac,
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                BreIcon(path: CustomIcons.stars),
                Container(
                  margin: const EdgeInsets.only(top: 80, bottom: 22),
                  alignment: Alignment.center,
                  child: BreIcon(path: CustomIcons.flower),
                )
              ],
            ),
            const Text(
              'Meditations',
              style: TextStyle(
                  fontFamily: 'PT-Serif',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.black),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                '10 HOURS THIS MONTH',
                style: TextStyle(
                    fontFamily: 'inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.lavender2),
              ),
            ),
          ],
        )),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 23),
        child: ListView(
          itemExtent: 129,
          children: [
            ...steps.map((BreathersShortModel breathe) => GestureDetector(
                  onTap: () {
                    navigatorPushNames(
                        context, RoutesPath.routeBreather, breathe);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 23),
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.topLeft,
                        width: 327,
                        decoration: BoxDecoration(
                          color: CustomColors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.black.withOpacity(0.08),
                              spreadRadius: 4,
                              blurRadius: 60,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BreLabel(
                              label: '12 CIRCLES',
                              fontSize: 10,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 6),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                'Relax breathing',
                                style: TextStyle(
                                    fontFamily: 'PT-Serif',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: CustomColors.black),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     ...steps.map((BreathersShortModel breathe) => GestureDetector(
      //           onTap: () {
      //             navigatorPushNames(
      //                 context, RoutesPath.routeBreather, breathe);
      //           },
      //           child: Container(
      //             margin: const EdgeInsets.only(top: 23),
      //             padding: const EdgeInsets.all(16),
      //             alignment: Alignment.topLeft,
      //             height: 129,
      //             width: 327,
      //             decoration: BoxDecoration(
      //               color: CustomColors.white,
      //               borderRadius: BorderRadius.circular(16),
      //               boxShadow: [
      //                 BoxShadow(
      //                   color: CustomColors.black.withOpacity(0.08),
      //                   spreadRadius: 4,
      //                   blurRadius: 60,
      //                   offset: const Offset(0, 0),
      //                 ),
      //               ],
      //             ),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 BreLabel(
      //                   label: '12 CIRCLES',
      //                   fontSize: 10,
      //                   padding: const EdgeInsets.symmetric(
      //                       horizontal: 8, vertical: 6),
      //                 ),
      //                 Padding(
      //                   padding: EdgeInsets.only(top: 15),
      //                   child: const Text(
      //                     'Relax breathing',
      //                     style: TextStyle(
      //                         fontFamily: 'PT-Serif',
      //                         fontSize: 20,
      //                         fontWeight: FontWeight.bold,
      //                         color: CustomColors.black),
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ))
      //   ],
      // )
    );
    // return Scaffold(
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         ...steps.map((BreathersShortModel breathe) => TextButton(
    //             child: Text(breathe.name),
    //             onPressed: () {
    //               navigatorPushNames(
    //                   context, RoutesPath.routeBreather, breathe);
    //             }))
    //       ],
    //     ),
    //   ),
    // );
  }
}
