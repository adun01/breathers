import 'package:breather/models/practic-step.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BreatheDBPracticStep {
  static void registerAdapter() {
    Hive.registerAdapter<BreathePracticStepModel>(BreathePracticStepModelAdapter());
  }
}
