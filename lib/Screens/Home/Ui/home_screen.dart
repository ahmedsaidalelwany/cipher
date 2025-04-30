import 'package:cipher/Screens/Home/Widgets/encryption_settings.dart';
import 'package:cipher/Screens/Home/Widgets/encryption_type.dart';
import 'package:cipher/Screens/Home/Widgets/input.dart';
import 'package:cipher/Screens/Home/Widgets/output.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Manager/Bloc/cipher_bloc.dart';
import '../../../Manager/Bloc/cipher_event.dart';
import '../../../Manager/Bloc/cipher_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'Assets/Images/Logo/logo.png',
          color: Colors.black,
          height: 130,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(11),
        child: BlocConsumer<CipherBloc, CipherState>(
          listener: (context, state) {
            if (state.error != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error!)),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  EncryptionType(),
                  EncryptionSettings(),
                  Input(),
                  Output(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}