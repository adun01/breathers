import 'package:breather/constants/breathe-type.dart';
import 'package:breather/models/practice-step.dart';
import 'package:breather/models/practice.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BreatheDBPractics {
  static late Box<BreathePracticeModel> _openedBox;

  static BreathePracticeModel? getById(int id) {
    return _openedBox.get(id);
  }

  static Future<Box<BreathePracticeModel>> openBox() async {
    Hive.registerAdapter<BreathePracticeModel>(BreathePracticeModelAdapter());
    _openedBox = await Hive.openBox<BreathePracticeModel>('practics');

    if (_openedBox.isEmpty) {
      initDefaultValues();
    }

    return _openedBox;
  }

  static void initDefaultValues() {
    _openedBox.addAll([
      BreathePracticeModel(
          name: 'Clear mind breathing',
          steps: [
            BreathePracticeStepModel(3, BreatheType.inhale),
            BreathePracticeStepModel(8, BreatheType.exhale),
          ],
          circles: 12),
      BreathePracticeModel(
          name: 'Relax breathing',
          steps: [
            BreathePracticeStepModel(3, BreatheType.inhale),
            BreathePracticeStepModel(6, BreatheType.exhale),
            BreathePracticeStepModel(6, BreatheType.hold),
          ],
          circles: 10),
      BreathePracticeModel(
          name: 'Calming breathing',
          steps: [
            BreathePracticeStepModel(3, BreatheType.inhale),
            BreathePracticeStepModel(6, BreatheType.hold),
            BreathePracticeStepModel(3, BreatheType.exhale),
            BreathePracticeStepModel(6, BreatheType.hold),
          ],
          circles: 17),
      BreathePracticeModel(
          name: 'Power breathing',
          steps: [
            BreathePracticeStepModel(3, BreatheType.inhale),
            BreathePracticeStepModel(6, BreatheType.hold),
            BreathePracticeStepModel(6, BreatheType.exhale),
          ],
          circles: 17),
      BreathePracticeModel(
          name: 'Harmony breathing',
          steps: [
            BreathePracticeStepModel(3, BreatheType.inhale),
            BreathePracticeStepModel(9, BreatheType.hold),
            BreathePracticeStepModel(6, BreatheType.exhale),
            BreathePracticeStepModel(3, BreatheType.hold),
          ],
          circles: 17),
      BreathePracticeModel(
          name: 'Anti stress breathing',
          steps: [
            BreathePracticeStepModel(9, BreatheType.inhale),
            BreathePracticeStepModel(2, BreatheType.exhale),
          ],
          circles: 17)
    ]);
  }
}
