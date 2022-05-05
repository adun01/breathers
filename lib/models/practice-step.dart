import 'package:breather/constants/breathe-type.dart';
import 'package:breather/constants/colors.dart';
import 'package:breather/models/hive-type-id.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'practice-step.g.dart';

@HiveType(typeId: HiveTypeId.step)
class BreathePracticeStepModel {
  @HiveField(0)
  int time;
  @HiveField(1)
  BreatheType type;

  BreathePracticeStepModel(this.time, this.type);

  int get duration {
    return time * 1000;
  }

  Color get color {
    switch (type) {
      case BreatheType.inhale:
        return CustomColors.bananaMania;
      case BreatheType.exhale:
        return CustomColors.roseBud;
      case BreatheType.hold:
        return CustomColors.deYork;
      default:
        return CustomColors.bananaMania;
    }
  }

  String get icon {
    switch (type) {
      case BreatheType.inhale:
        return 'assets/icons/inhale.svg';
      case BreatheType.exhale:
        return 'assets/icons/exhale.svg';
      case BreatheType.hold:
        return 'assets/icons/hold.svg';
      default:
        return '';
    }
  }

  String title(BuildContext context) {
    switch (type) {
      case BreatheType.inhale:
        return AppLocalizations.of(context)!.inhale;;
      case BreatheType.exhale:
        return AppLocalizations.of(context)!.exhale;;
      case BreatheType.hold:
        return AppLocalizations.of(context)!.hold;;
      default:
        return '';
    }
  }

  String label(BuildContext context) {
    return AppLocalizations.of(context)!.seconds;
  }
}
