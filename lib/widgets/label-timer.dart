import 'dart:async';

import 'package:breather/widgets/label.dart';
import 'package:flutter/material.dart';

class BreatheLabelTimer extends StatefulWidget {
  bool play;
  int time;
  int progressTime = 0;
  String label;
  double? fontSize;
  EdgeInsets? padding;

  BreatheLabelTimer(
      {Key? key,
      required this.label,
      this.fontSize,
      this.padding,
      required this.play,
      required this.time})
      : super(key: key);

  @override
  _BreatheLabelTimer createState() => _BreatheLabelTimer(
      label: label,
      fontSize: fontSize,
      play: play,
      padding: padding,
      time: time);
}

class _BreatheLabelTimer extends State {
  bool play;
  int time;
  int progressTime = 0;
  String label;
  double? fontSize;
  EdgeInsets? padding;

  _BreatheLabelTimer(
      {Key? key,
      required this.label,
      this.fontSize,
      this.padding,
      required this.play,
      required this.time});

  @override
  void initState() {
    if (play) {
      startTimer();
    }
    super.initState();
  }

  void startTimer() {
    Timer(Duration(seconds: 1), () {
      if (progressTime >= time) {
        progressTime = 0;
      } else {
        if (mounted) {
          setState(() {
            progressTime++;
          });
          startTimer();
        }
      }
    });
  }

  String get labelWithTime {
    if (play) {
      return '${time - progressTime} ${label}';
    }
    return label;
  }

  @override
  Widget build(BuildContext context) {
    return BreatheLabel(
      label: labelWithTime,
      fontSize: fontSize,
      padding: padding,
    );
  }
}
