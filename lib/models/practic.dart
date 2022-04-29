import 'package:breather/constants/breathe-type.dart';
import 'package:breather/models/hive-type-id.dart';
import 'package:breather/models/practic-step.dart';
import 'package:hive/hive.dart';

part 'practic.g.dart';

@HiveType(typeId: HiveTypeId.practic)
class BreathePracticModel extends HiveObject {
  static BreathePracticStepModel pauseStep =
      BreathePracticStepModel(0, BreatheType.hold);
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final List<BreathePracticStepModel> steps;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final int circles;

  BreathePracticModel(
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
