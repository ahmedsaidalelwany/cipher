import 'package:cipher/Screens/Splash/Ui/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Manager/Bloc/cipher_bloc.dart';
import 'Screens/Home/Ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cipher App',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Cairo'),
      home: BlocProvider(
        create: (context) => CipherBloc(),
        child: const Splash(),
      ),
      localizationsDelegates: const [],
      supportedLocales: const [Locale('en', 'US')],
    );
  }
}
