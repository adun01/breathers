import 'package:breather/constants/colors.dart';
import 'package:breather/models/practic-step.dart';
import 'package:breather/models/practic.dart';
import 'package:breather/widgets/circular-percent.dart';
import 'package:breather/widgets/label-timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const titleStyles = const TextStyle(
    color: CustomColors.balticSea,
    height: 1.28,
    fontFamily: 'PT-Serif',
    fontSize: 32,
    fontWeight: FontWeight.w700);

class BreathePractic extends StatefulWidget {
  BreathePractic(Key? key) : super(key: key);

  @override
  _BreathePracticState createState() => _BreathePracticState();
}

class _BreathePracticState extends State {
  final BreathePracticModel practic = BreathePracticModel();

  var activeStepIndex = 0;
  var activeCircleIndex = 0;
  var play = false;

  BreathePracticStepModel get activeStep {
    return practic.steps[activeStepIndex];
  }

  void togglePlay() {
    if (play) {
      setState(() {
        play = false;
        activeStepIndex = 0;
      });
    } else {
      setState(() {
        play = true;
      });
    }
  }

  void nextStep() {
    if (activeStepIndex < practic.steps.length - 1) {
      setState(() {
        activeStepIndex++;
      });
    } else {
      setState(() {
        activeStepIndex = 0;
        activeCircleIndex++;
      });
    }
  }

  List<Widget> getCirlces() {
    var passedPercent = 0.0;
    if (!play) {
      return [];
    }
    return practic.steps
        .sublist(0, activeStepIndex + 1)
        .asMap()
        .entries
        .map((entry) {
      BreathePracticStepModel step = entry.value;
      final double percent = step.duration / practic.totalDuration;
      final double startAngle = passedPercent * 360;
      passedPercent += percent;
      return BreatheCirculatPercend(
        key: ValueKey('${entry.key} circle key ${activeCircleIndex}'),
        progressColor: step.color,
        animationDuration: step.duration,
        percent: step.duration / practic.totalDuration,
        onAnimationEnd: nextStep,
        startAngle: startAngle,
      );
    }).toList();
  }

  String get title {
    if (!play) {
      return 'Be ready';
    }
    return practic.steps[activeStepIndex].title;
  }

  String get label {
    if (!play) {
      return 'PRESS START';
    }
    return practic.steps[activeStepIndex].label;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 10),
          child: Text(
            title,
            style: titleStyles,
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: BreatheLabelTimer(
                key: UniqueKey(),
                time: activeStep.time,
                label: label,
                play: play)),
        Stack(
          children: [
            Container(
              width: 288,
              height: 288,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomColors.white,
                border: Border.all(
                  color: CustomColors.concrete.withOpacity(0.5),
                  width: 32,
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.black.withOpacity(0.12),
                    spreadRadius: 4,
                    blurRadius: 60,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: Container(
                  key: ValueKey<String>(
                      play ? activeStep.icon : practic.pauseStep.icon),
                  child: SvgPicture.asset(
                    play ? activeStep.icon : practic.pauseStep.icon,
                  ),
                ),
              ),
              // child: SvgPicture.asset(
              //   play ? activeStep.icon : practic.pauseStep.icon,
              // ),
            ),
            ...getCirlces(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: TextButton(
            style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: CustomColors.lavender,
                shape: const CircleBorder(),
                maximumSize: Size.infinite,
                fixedSize: const Size(48.0, 48.0)),
            child: Icon(
              play ? Icons.stop : Icons.play_arrow,
              color: CustomColors.white,
              size: 32,
            ),
            onPressed: () {
              togglePlay();
            },
          ),
        ),
      ],
    );
  }
}
