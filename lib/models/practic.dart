import 'package:breather/constants/breathe-type.dart';
import 'package:breather/models/practic-step.dart';

class BreathePracticModel {
  BreathePracticStepModel pauseStep = BreathePracticStepModel(0, BreatheType.hold);
  final List<BreathePracticStepModel> steps = [
    BreathePracticStepModel(7, BreatheType.inhale),
    BreathePracticStepModel(3, BreatheType.hold),
    BreathePracticStepModel(7, BreatheType.exhale),
    BreathePracticStepModel(3, BreatheType.hold),
  ];

  int get totalDuration {
    var duration = 0;
    steps.forEach((element) {
      duration += element.duration;
    });
    return duration;
  }
}
