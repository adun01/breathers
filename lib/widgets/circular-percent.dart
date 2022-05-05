import 'package:breather/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BreatheCirculatPercent extends StatelessWidget {
  int animationDuration;
  double radius;
  double lineWidth;
  double percent;
  double startAngle;
  bool animateFromLastPercent;

  Color? progressColor;
  VoidCallback? onAnimationEnd;

  BreatheCirculatPercent(
      {Key? key,
      required this.animationDuration,
      required this.percent,
      required this.startAngle,
      this.radius = 144,
      this.lineWidth = 32,
      this.progressColor,
      this.animateFromLastPercent = false,
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
      radius: radius,
      lineWidth: lineWidth,
      animateFromLastPercent: animateFromLastPercent,
      animation: true,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
