import 'package:auto_route/auto_route.dart';
import 'package:breather/constants/colors.dart';
import 'package:breather/db/practics.dart';
import 'package:breather/routes/routes.gr.dart';
import 'package:breather/widgets/layout/header.dart';
import 'package:flutter/material.dart';
import 'package:breather/widgets/breathe.dart';

class BreathePracticePage extends StatelessWidget {
  final int id;
  BreathePracticePage({Key? key, @pathParam required this.id});

  @override
  Widget build(BuildContext context) {
    final args = context.routeData.args as BreathePracticPageRouterArgs;

    return Scaffold(
      backgroundColor: CustomColors.selago2,
      body: Column(
        children: [
          BreatheHeader(),
          Expanded(
              child: ListView(
            children: [
              BreathePractice(
                key: UniqueKey(),
                practice: BreatheDBPractics.getById(args.id)!,
              )
            ],
          ))
        ],
      ),
    );
  }
}
