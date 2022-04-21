import 'dart:ui';

import 'package:breather/dto/breathe-type.dart';
import 'package:flutter/material.dart';

class StepIndicator {
  int startTime;
  int time;
  int totalSteps;
  int totalTime;
  BreatheTypeDto type;
  StepIndicator(this.startTime, this.time, this.totalSteps, this.totalTime, this.type);

  String get labelWithProgress {
    switch (type) {
      case BreatheTypeDto.inhale: {
        return 'inhale ${time} sec.';
      }
      case BreatheTypeDto.exhale: {
        return 'exhale ${time} sec.';
      }
      case BreatheTypeDto.hold: {
        return 'hold ${time} sec.';
      }
      case BreatheTypeDto.free: {
        return '';
      }
      default: {
        return 'inhale ${time} sec.';
      }
    }
  }

  String get label {
    switch (type) {
      case BreatheTypeDto.inhale: {
        return 'inhale';
      }
      case BreatheTypeDto.exhale: {
        return 'exhale';
      }
      case BreatheTypeDto.hold: {
        return 'hold';
      }
      case BreatheTypeDto.free: {
        return '';
      }
      default: {
        return 'inhale';
      }
    }
  }

  Color get color {
    switch (type) {
      case BreatheTypeDto.inhale: {
        return Colors.blue;
      }
      case BreatheTypeDto.exhale: {
        return Colors.purple;
      }
      case BreatheTypeDto.hold: {
        return Colors.grey;
      }
      case BreatheTypeDto.free: {
        return Colors.white;
      }
      default: {
        return Colors.purple;
      }
    }
  }

  int get endTime {
    return startTime + time;
  }

  double get beginProgress {
    return startTime / totalTime;
  }

  double get endProgress {
    return time / totalTime + beginProgress;
  }
}
