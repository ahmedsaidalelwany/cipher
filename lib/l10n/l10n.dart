import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Import generated file
import 'app_localizations.dart';

extension LocalizationExt on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

class L10n {
  static final supportedLocales = [
    const Locale('en', 'US'),
    const Locale('ar', 'EG'),
  ];

  static const delegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}