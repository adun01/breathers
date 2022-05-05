import 'package:breather/constants/breathe-type.dart';
import 'package:breather/models/hive-type-id.dart';
import 'package:breather/models/practice-step.dart';
import 'package:hive/hive.dart';

part 'practice.g.dart';

@HiveType(typeId: HiveTypeId.practic)
class BreathePracticeModel extends HiveObject {
  static BreathePracticeStepModel pauseStep =
      BreathePracticeStepModel(0, BreatheType.hold);
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final List<BreathePracticeStepModel> steps;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final int circles;

  BreathePracticeModel(
      {required this.name,
      required this.steps,
      required this.circles,
      this.id});

  int get totalDuration {
    var duration = 0;
    steps.forEach((element) {
      duration += element.duration;
    });
    return duration;
  }
}
