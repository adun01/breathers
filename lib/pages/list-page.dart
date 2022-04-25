import 'package:auto_route/auto_route.dart';
import 'package:breather/constants/colors.dart';
import 'package:breather/constants/icons.dart';
import 'package:breather/routes/routes.gr.dart';
import 'package:breather/widgets/icon.dart';
import 'package:breather/widgets/label.dart';
import 'package:flutter/material.dart';

import 'package:breather/models/breathes.dart';

class ListPage extends StatelessWidget {
  final List<BreathersShortModel> steps = BreathersShortModel.getListMock();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.whiteLilac,
      body: Column(
        children: [
          SafeArea(
              child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  BreIcon(path: CustomIcons.stars),
                  Container(
                    margin: const EdgeInsets.only(top: 80, bottom: 22),
                    alignment: Alignment.center,
                    child: BreIcon(path: CustomIcons.flower),
                  )
                ],
              ),
            ],
          )),
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
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 23),
              child: ListView(
                itemExtent: 129,
                children: [
                  ...steps.map((BreathersShortModel breathe) => GestureDetector(
                        onTap: () {
                          AutoRouter.of(context)
                              .navigate(BrPageRouter(children: [
                            BreathePageRouter(id: breathe.id),
                          ]));
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
          )
        ],
      ),
    );
  }
}
