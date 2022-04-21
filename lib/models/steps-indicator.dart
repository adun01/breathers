import 'package:breather/dto/breathe-step.dart';
import 'package:breather/dto/breathe-type.dart';

import 'package:breather/models/step-indicator.dart';

class StepsIndicator {
  List<StepIndicator> steps = [];
  int totalTime = 0;
  int circles = 0;

  StepsIndicator(List<BreatheStepDto> steps, this.circles) {
    for (var i = 0; i < steps.length; i++) {
      totalTime+=steps[i].time;
    }
    var lastTime = 0;
    for (var i = 0; i < steps.length; i++) {
      final step = steps[i];
      this.steps.add(
          StepIndicator(lastTime, step.time, steps.length, totalTime, step.type)
      );
      lastTime+= step.time;
    }
  }

  static StepsIndicator StepsIndicatorMock(int mockId) {
    switch (mockId) {
      case 1: {
        final List<BreatheStepDto> steps = [
          BreatheStepDto(BreatheTypeDto.inhale, 4),
          BreatheStepDto(BreatheTypeDto.hold, 3),
          BreatheStepDto(BreatheTypeDto.exhale, 4),
          BreatheStepDto(BreatheTypeDto.hold, 3),
        ];
        return StepsIndicator(steps, 10);
      }
      case 2: {
        final List<BreatheStepDto> steps = [
          BreatheStepDto(BreatheTypeDto.inhale, 7),
          BreatheStepDto(BreatheTypeDto.exhale, 7),
        ];
        return StepsIndicator(steps, 20);
      }
      case 3: {
        final List<BreatheStepDto> steps = [
          BreatheStepDto(BreatheTypeDto.inhale, 7),
          BreatheStepDto(BreatheTypeDto.hold, 7),
          BreatheStepDto(BreatheTypeDto.exhale, 7),
        ];
        return StepsIndicator(steps, 7);
      }
      default: {
        final List<BreatheStepDto> steps = [
          BreatheStepDto(BreatheTypeDto.inhale, 2),
          BreatheStepDto(BreatheTypeDto.hold, 3),
          BreatheStepDto(BreatheTypeDto.exhale, 2),
          BreatheStepDto(BreatheTypeDto.inhale, 2),
        ];
        return StepsIndicator(steps, 2);
      }
    }
  }
}
