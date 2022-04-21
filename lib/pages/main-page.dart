import 'package:flutter/material.dart';

import 'package:breather/constants/routes.dart';
import 'package:breather/models/breathes.dart';

class MainPage extends StatelessWidget {

  final List<BreathersShortModel> steps = BreathersShortModel.getListMock();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...steps.map((BreathersShortModel breathe) => Padding(
                padding: EdgeInsets.all(20.0),
                child: GestureDetector(
                    onTap: () {
                      navigatorPushNames(
                          context, RoutesPath.routeBreather, breathe);
                    },
                    child: Text(breathe.name)))),
          ],
        ),
      ),
    );
  }
}


