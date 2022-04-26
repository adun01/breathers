import 'package:breather/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BreatheCirculatPercend extends StatelessWidget {
  int animationDuration;
  double percent;
  double startAngle;

  Color? progressColor;
  VoidCallback? onAnimationEnd;

  BreatheCirculatPercend(
      {Key? key,
      required this.animationDuration,
      required this.percent,
      required this.startAngle,
      this.progressColor,
      this.onAnimationEnd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      key: key,
      progressColor: progressColor,
      animationDuration: animationDuration,
      percent: percent,
      onAnimationEnd: () {
        this.onAnimationEnd!();
      },
      startAngle: startAngle,
      backgroundColor: CustomColors.transparent,
      radius: 144,
      lineWidth: 32,
      animation: true,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
