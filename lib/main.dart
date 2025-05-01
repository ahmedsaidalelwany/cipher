import 'package:cipher/Manager/Provider/app_settings_provider.dart';
import 'package:cipher/Screens/Splash/Ui/splash.dart';
import 'package:cipher/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'Manager/Bloc/cipher_bloc.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AppSettingsProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<AppSettingsProvider>(context);

    return MaterialApp(
      title: 'Cipher App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey,
          fontFamily: 'Cairo'),
      locale: settings.locale,
      supportedLocales: L10n.supportedLocales,
      localizationsDelegates: L10n.delegates,
      home: BlocProvider(
        create: (context) => CipherBloc(),
        child: const Splash(),
      ),
    );
  }
}
