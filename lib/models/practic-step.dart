import 'package:breather/constants/breathe-type.dart';
import 'package:breather/constants/colors.dart';
import 'package:flutter/material.dart';

class BreathePracticStepModel {
  int time;
  BreatheType type;

  BreathePracticStepModel(this.time, this.type);

  int get duration {
    return time * 1000;
  }

  Color get color {
    switch (type) {
      case BreatheType.inhale:
        return CustomColors.bananaMania;
      case BreatheType.exhale:
        return CustomColors.roseBud;
      case BreatheType.hold:
        return CustomColors.deYork;
      default:
        return CustomColors.bananaMania;
    }
  }

  String get icon {
    switch (type) {
      case BreatheType.inhale:
        return 'assets/icons/inhale.svg';
      case BreatheType.exhale:
        return 'assets/icons/exhale.svg';
      case BreatheType.hold:
        return 'assets/icons/hold.svg';
      default:
        return '';
    }
  }

  String get title {
    switch (type) {
      case BreatheType.inhale:
        return 'Inhale';
      case BreatheType.exhale:
        return 'Exhale';
      case BreatheType.hold:
        return 'Hold';
      default:
        return '';
    }
  }

  String get label {
    return 'SECONDS';
  }
}