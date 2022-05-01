import 'package:breather/l10n/all_locales.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = AllLocales.all[0];

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!AllLocales.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = AllLocales.all[0];
    notifyListeners();
  }
}
