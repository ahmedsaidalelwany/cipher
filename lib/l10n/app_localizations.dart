import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale);

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ar'),
  ];

  String get appTitle;
  String get encryptionType;
  String get encryptionSettings;
  String get caesar;
  String get vigenere;
  String shift(int shift);
  String get key;
  String get enterKey;
  String get enterText;
  String get writeTextHere;
  String get encrypt;
  String get decrypt;
  String get output;
  String get outputDisplayText;
  String get copy;
  String get copiedToClipboard;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Replace `GeneratedAppLocalizations` with the actual generated class for the locale
    return SynchronousFuture<AppLocalizations>(_lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;

  AppLocalizations _lookupAppLocalizations(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return GeneratedAppLocalizationsEn();
      case 'ar':
        return GeneratedAppLocalizationsAr();
      default:
        throw FlutterError('AppLocalizations.delegate failed to load unsupported locale "$locale"');
    }
  }
}

// Replace these with the actual generated classes for each locale
class GeneratedAppLocalizationsEn extends AppLocalizations {
  GeneratedAppLocalizationsEn() : super('en');

  @override
  String get appTitle => 'App Title';
  @override
  String get encryptionType => 'Encryption Type';
  @override
  String get encryptionSettings => 'Encryption Settings';
  @override
  String get caesar => 'Caesar';
  @override
  String get vigenere => 'Vigenere';
  @override
  String shift(int shift) => 'Shift: $shift';
  @override
  String get key => 'Key';
  @override
  String get enterKey => 'Enter Key';
  @override
  String get enterText => 'Enter Text';
  @override
  String get writeTextHere => 'Write your text here';
  @override
  String get encrypt => 'Encrypt';
  @override
  String get decrypt => 'Decrypt';
  @override
  String get output => 'Output';
  @override
  String get outputDisplayText => 'Output Display Text';
  @override
  String get copy => 'Copy';
  @override
  String get copiedToClipboard => 'Copied to Clipboard';
}

class GeneratedAppLocalizationsAr extends AppLocalizations {
  GeneratedAppLocalizationsAr() : super('ar');

  @override
  String get appTitle => 'عنوان التطبيق';
  @override
  String get encryptionType => 'نوع التشفير';
  @override
  String get encryptionSettings => 'إعدادات التشفير';
  @override
  String get caesar => 'قيصر';
  @override
  String get vigenere => 'فيجينير';
  @override
  String shift(int shift) => 'الإزاحة: $shift';
  @override
  String get key => 'المفتاح';
  @override
  String get enterKey => 'أدخل المفتاح';
  @override
  String get enterText => 'أدخل النص';
  @override
  String get writeTextHere => 'اكتب النص هنا';
  @override
  String get encrypt => 'تشفير';
  @override
  String get decrypt => 'فك التشفير';
  @override
  String get output => 'الناتج';
  @override
  String get outputDisplayText => 'عرض الناتج';
  @override
  String get copy => 'نسخ';
  @override
  String get copiedToClipboard => 'تم النسخ إلى الحافظة';
}