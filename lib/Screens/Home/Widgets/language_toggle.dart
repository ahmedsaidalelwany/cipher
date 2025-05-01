import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Manager/Provider/app_settings_provider.dart';

class LanguageToggle extends StatelessWidget {
  const LanguageToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<AppSettingsProvider>(context);
    final isArabic = settings.locale.languageCode == 'ar';

    return IconButton(
      icon: Text(
        isArabic ? 'EN' : 'عربي',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      onPressed: () {
        settings.toggleLanguage();
      },
      tooltip: isArabic ? 'Switch to English' : 'التبديل إلى العربية',
    );
  }
}