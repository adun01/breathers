import 'package:breather/constants/colors.dart';
import 'package:breather/widgets/layout/bottom-navigation-bar.dart';
import 'package:breather/widgets/layout/header.dart';
import 'package:breather/widgets/layout/layout-page.dart';
import 'package:flutter/material.dart';

import 'package:breather/models/breathes.dart';
import 'package:breather/widgets/breathe.dart';

import '../constants/routes.dart';

class BreathePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as BreathersShortModel;
    return BreLayoutPage(
        child: Breathe(), backgroundColor: CustomColors.selago2);
  }
}
