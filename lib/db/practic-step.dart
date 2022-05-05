import 'package:breather/models/practice-step.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BreatheDBPracticStep {
  static void registerAdapter() {
    Hive.registerAdapter<BreathePracticeStepModel>(BreathePracticeStepModelAdapter());
  }
}
