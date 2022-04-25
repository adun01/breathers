import 'package:auto_route/auto_route.dart';
import 'package:breather/constants/colors.dart';
import 'package:breather/routes/routes.gr.dart';
import 'package:breather/widgets/layout/layout-page.dart';
import 'package:flutter/material.dart';

import 'package:breather/widgets/breathe.dart';

class BreathePage extends StatelessWidget {
  final int id;
  BreathePage({Key? key, @pathParam required this.id});

  @override
  Widget build(BuildContext context) {
    final args = context.routeData.args as BreathePageRouterArgs;
    return BreLayoutPage(
        child: Breathe(), backgroundColor: CustomColors.selago2);
  }
}
