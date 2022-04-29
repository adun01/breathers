import 'package:hive_flutter/hive_flutter.dart';

class BreatheDB {
  static Future<void> init() async {
    await Hive.initFlutter();
  }
}
