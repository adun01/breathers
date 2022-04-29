import 'package:breather/constants/breathe-type.dart';
import 'package:breather/models/hive-type-id.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BreatheStepTypeAdapter extends TypeAdapter<BreatheType> {
  static void registerAdapter() {
    Hive.registerAdapter<BreatheType>(BreatheStepTypeAdapter());
  }

  @override
  int get typeId => HiveTypeId.stepType;

  @override
  read(BinaryReader reader) {
    final value = reader.read();
    if (value == '2') {
      return BreatheType.exhale;
    } else if (value == '0') {
      return BreatheType.inhale;
    }
    return BreatheType.hold;
  }

  @override
  void write(BinaryWriter writer, BreatheType type) {
    if (type == BreatheType.exhale) {
      writer.write('2');
    } else if (type == BreatheType.inhale) {
      writer.write('0');
    } else {
      writer.write('1');
    }
  }
}
