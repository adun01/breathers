import 'package:breather/constants/colors.dart';
import 'package:breather/locale_provider.dart';
import 'package:breather/models/practice-step.dart';
import 'package:breather/models/practice.dart';
import 'package:breather/widgets/circular-percent.dart';
import 'package:breather/widgets/label-timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/practice.dart';

const titleStyles = const TextStyle(
    color: CustomColors.balticSea,
    height: 1.28,
    fontFamily: 'PT-Serif',
    fontSize: 32,
    fontWeight: FontWeight.w700);

class BreathePractice extends StatefulWidget {
  final BreathePracticeModel practice;
  BreathePractice({Key? key, required this.practice}) : super(key: key);

  @override
  _BreathePracticeState createState() => _BreathePracticeState(practice);
}

class _BreathePracticeState extends State {
  final BreathePracticeModel practice;

  _BreathePracticeState(this.practice);

  var activeStepIndex = 0;
  var activeCircleIndex = 0;
  var totalTime = 0;
  var play = false;

  BreathePracticeStepModel get activeStep {
    return practice.steps[activeStepIndex];
  }

  @override
  void initState() {
    int oneCircleTime = 0;
    for (var i = 0; i < practice.steps.length; i++) {
      oneCircleTime+= practice.steps[i].time;
    }
    totalTime = oneCircleTime * practice.circles;
    super.initState();
  }

  void resetProgress() {
    setState(() {
      play = false;
      activeStepIndex = 0;
      activeCircleIndex = 0;
    });
  }

  void togglePlay() {
    if (play) {
      resetProgress();
    } else {
      setState(() {
        play = true;
      });
    }
  }

  int get totalSteps {
    return practice.steps.length * practice.circles;
  }

  void nextStep() {
    if (!play) {
      return;
    }
    if (
      activeCircleIndex + 1 == practice.circles &&
      activeStepIndex + 1 == practice.steps.length
    ) {
      resetProgress();
    } else if (activeStepIndex < practice.steps.length - 1) {
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

  List<Widget> getCircles() {
    var passedPercent = 0.0;
    if (!play) {
      return [];
    }
    return practice.steps
        .sublist(0, activeStepIndex + 1)
        .asMap()
        .entries
        .map((entry) {
      BreathePracticeStepModel step = entry.value;
      final double percent = step.duration / practice.totalDuration;
      final double startAngle = passedPercent * 360;
      passedPercent += percent;
      return BreatheCirculatPercent(
        key: ValueKey('${entry.key} circle key ${activeCircleIndex}'),
        progressColor: step.color,
        animationDuration: step.duration,
        percent: step.duration / practice.totalDuration,
        onAnimationEnd: nextStep,
        startAngle: startAngle,
      );
    }).toList();
  }

  String title(BuildContext context) {
    if (!play) {
      return AppLocalizations.of(context)!.press_start;
    }
    return practice.steps[activeStepIndex].title(context);
  }

  String label(BuildContext context) {
    if (!play) {
      return AppLocalizations.of(context)!.be_ready;
    }
    return practice.steps[activeStepIndex].label(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChangeNotifierProvider<LocaleProvider>(
            create: (_) => LocaleProvider(),
            builder: (context, child) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 32, bottom: 10),
                    child: Text(
                      title(context),
                      style: titleStyles,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: BreatheLabelTimer(
                          key: UniqueKey(),
                          time: activeStep.time,
                          label: label(context),
                          play: play)),
                ],
              );
            }),
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
                  key: ValueKey<String>(play
                      ? activeStep.icon
                      : BreathePracticeModel.pauseStep.icon),
                  child: SvgPicture.asset(
                    play ? activeStep.icon : BreathePracticeModel.pauseStep.icon,
                  ),
                ),
              ),
            ),
            ...getCircles(),
            Padding(
              padding: EdgeInsets.only(top: 33, left: 32),
              child: BreatheCirculatPercent(
                progressColor: CustomColors.lavender,
                animationDuration: totalTime * 1000,
                percent: play ? 1 : 0,
                radius: 112,
                lineWidth: 3,
                startAngle: 0,
                onAnimationEnd: () {},
              ),
            )
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
