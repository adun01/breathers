import 'package:breather/constants/colors.dart';
import 'package:breather/dto/breathe-type.dart';
import 'package:breather/widgets/circular-percent.dart';
import 'package:breather/widgets/label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BreathePracticStep {
  int time;
  BreatheTypeDto type;

  BreathePracticStep(this.time, this.type);

  int get duration {
    return time * 1000;
  }

  Color get color {
    switch (type) {
      case BreatheTypeDto.inhale:
        return CustomColors.bananaMania;
      case BreatheTypeDto.exhale:
        return CustomColors.roseBud;
      case BreatheTypeDto.hold:
        return CustomColors.deYork;
      default:
        return CustomColors.bananaMania;
    }
  }

  String get icon {
    switch (type) {
      case BreatheTypeDto.inhale:
        return 'assets/icons/inhale.svg';
      case BreatheTypeDto.exhale:
        return 'assets/icons/exhale.svg';
      case BreatheTypeDto.hold:
        return 'assets/icons/hold.svg';
      default:
        return '';
    }
  }

  String get title {
    switch (type) {
      case BreatheTypeDto.inhale:
        return 'Inhale';
      case BreatheTypeDto.exhale:
        return 'Exhale';
      case BreatheTypeDto.hold:
        return 'Hold';
      default:
        return '';
    }
  }

  String get label {
    return '${time} SECONDS';
  }
}

class BreathePracticList {
  BreathePracticStep pauseStep = BreathePracticStep(0, BreatheTypeDto.hold);
  final List<BreathePracticStep> steps = [
    BreathePracticStep(7, BreatheTypeDto.inhale),
    BreathePracticStep(3, BreatheTypeDto.hold),
    BreathePracticStep(7, BreatheTypeDto.exhale),
    BreathePracticStep(3, BreatheTypeDto.hold),
  ];

  int get totalDuration {
    var duration = 0;
    steps.forEach((element) {
      duration += element.duration;
    });
    return duration;
  }
}

const titleStyles = const TextStyle(
    color: CustomColors.balticSea,
    height: 1.28,
    fontFamily: 'PT-Serif',
    fontSize: 32,
    fontWeight: FontWeight.w700);

class BreathePractic extends StatefulWidget {

  BreathePractic(Key? key): super(key: key);

  @override
  _BreathePracticState createState() => _BreathePracticState();
}

class _BreathePracticState extends State {
  final BreathePracticList practic = BreathePracticList();

  var activeStepIndex = 0;
  var activeCircleIndex = 0;
  var play = false;

  BreathePracticStep get activeStep {
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
      BreathePracticStep step = entry.value;
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
            child: BreatheLabel(
              label: label,
            )),
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
