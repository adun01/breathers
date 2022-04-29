import 'package:breather/constants/breathe-type.dart';
import 'package:breather/models/practic-step.dart';
import 'package:breather/models/practic.dart';

class BreathePracticMockModel extends BreathePracticModel {
  BreathePracticMockModel() : super(name: '', steps: [
    BreathePracticStepModel(7, BreatheType.inhale),
    BreathePracticStepModel(3, BreatheType.hold),
    BreathePracticStepModel(7, BreatheType.exhale),
    BreathePracticStepModel(3, BreatheType.hold),
  ], circles: 10);
}
