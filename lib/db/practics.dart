import 'package:breather/constants/breathe-type.dart';
import 'package:breather/models/practic-step.dart';
import 'package:breather/models/practic.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BreatheDBPractics {
  static late Box<BreathePracticModel> _openedBox;

  static BreathePracticModel? getById(int id) {
    return _openedBox.get(id);
  }

  static Future<Box<BreathePracticModel>> openBox() async {
    Hive.registerAdapter<BreathePracticModel>(BreathePracticModelAdapter());
    _openedBox = await Hive.openBox<BreathePracticModel>('practics');

    if (_openedBox.isEmpty) {
      initDefaultValues();
    }

    return _openedBox;
  }

  static void initDefaultValues() {
    _openedBox.addAll([
      BreathePracticModel(
          name: 'Clear mind breathing',
          steps: [
            BreathePracticStepModel(3, BreatheType.inhale),
            BreathePracticStepModel(8, BreatheType.exhale),
          ],
          circles: 12),
      BreathePracticModel(
          name: 'Relax breathing',
          steps: [
            BreathePracticStepModel(3, BreatheType.inhale),
            BreathePracticStepModel(6, BreatheType.exhale),
            BreathePracticStepModel(6, BreatheType.hold),
          ],
          circles: 10),
      BreathePracticModel(
          name: 'Calming breathing',
          steps: [
            BreathePracticStepModel(3, BreatheType.inhale),
            BreathePracticStepModel(6, BreatheType.hold),
            BreathePracticStepModel(3, BreatheType.exhale),
            BreathePracticStepModel(6, BreatheType.hold),
          ],
          circles: 17),
      BreathePracticModel(
          name: 'Power breathing',
          steps: [
            BreathePracticStepModel(3, BreatheType.inhale),
            BreathePracticStepModel(6, BreatheType.hold),
            BreathePracticStepModel(6, BreatheType.exhale),
          ],
          circles: 17),
      BreathePracticModel(
          name: 'Harmony breathing',
          steps: [
            BreathePracticStepModel(3, BreatheType.inhale),
            BreathePracticStepModel(9, BreatheType.hold),
            BreathePracticStepModel(6, BreatheType.exhale),
            BreathePracticStepModel(3, BreatheType.hold),
          ],
          circles: 17),
      BreathePracticModel(
          name: 'Anti stress breathing',
          steps: [
            BreathePracticStepModel(9, BreatheType.inhale),
            BreathePracticStepModel(2, BreatheType.exhale),
          ],
          circles: 17)
    ]);
  }
}
