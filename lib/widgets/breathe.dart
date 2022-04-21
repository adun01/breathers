import 'package:breather/constants/colors.dart';
import 'package:breather/dto/breathe-type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BreatheStep {
  int time;
  BreatheTypeDto type;

  BreatheStep(this.time, this.type);

  int get duration {
    return time * 1000;
  }

  Color get color {
    switch (type) {
      case BreatheTypeDto.inhale:
        {
          return CustomColors.bananaMania;
        }
      case BreatheTypeDto.exhale:
        {
          return CustomColors.roseBud;
        }
      case BreatheTypeDto.hold:
        {
          return CustomColors.deYork;
        }
      default:
        {
          return CustomColors.bananaMania;
        }
    }
  }

  String get icon {
    switch (type) {
      case BreatheTypeDto.inhale:
        {
          return 'assets/icons/inhale.svg';
        }
      case BreatheTypeDto.exhale:
        {
          return 'assets/icons/exhale.svg';
        }
      case BreatheTypeDto.hold:
        {
          return 'assets/icons/hold.svg';
        }
      default:
        {
          return 'assets/icons/hold.svg';
        }
    }
  }
}

class BreathePractic {
  BreatheStep pauseStep = BreatheStep(0, BreatheTypeDto.hold);
  final List<BreatheStep> steps = [
    BreatheStep(3, BreatheTypeDto.inhale),
    BreatheStep(3, BreatheTypeDto.hold),
    BreatheStep(3, BreatheTypeDto.exhale),
    BreatheStep(3, BreatheTypeDto.hold),
  ];

  int get totalDuration {
    var duration = 0;
    steps.forEach((element) {
      duration += element.duration;
    });
    return duration;
  }
}

class Breathe extends StatefulWidget {
  @override
  _BreatheState createState() => _BreatheState();
}

class _BreatheState extends State {
  final BreathePractic practic = BreathePractic();

  var activeStepIndex = 0;
  var activeCircleIndex = 0;
  var play = false;

  BreatheStep get activeStep {
    return practic.steps[activeStepIndex];
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
      int idx = entry.key;
      BreatheStep step = entry.value;
      final double percent = step.duration / practic.totalDuration;
      final double startAngle = passedPercent * 360;
      passedPercent += percent;
      print('here');
      return new CircularPercentIndicator(
        key: ValueKey(idx + activeCircleIndex),
        progressColor: step.color,
        animationDuration: step.duration,
        percent: percent,
        onAnimationEnd: () {
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
          ;
        },
        backgroundColor: CustomColors.transparent,
        startAngle: startAngle,
        radius: 144,
        lineWidth: 32,
        animation: true,
        circularStrokeCap: CircularStrokeCap.round,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        setState(() {
          play = true;
        })
      },
      child: Stack(
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
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
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
            //       play ? activeStep.icon : practic.pauseStep.icon,
            //     ),
          ),
          ...getCirlces(),
        ],
      ),
    );
  }
}
