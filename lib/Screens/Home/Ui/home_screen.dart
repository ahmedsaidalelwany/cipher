import 'package:cipher/Screens/Home/Widgets/encryption_settings.dart';
import 'package:cipher/Screens/Home/Widgets/encryption_type.dart';
import 'package:cipher/Screens/Home/Widgets/input.dart';
import 'package:cipher/Screens/Home/Widgets/language_toggle.dart';
import 'package:cipher/Screens/Home/Widgets/output.dart';
import 'package:cipher/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../Manager/Bloc/cipher_bloc.dart';
import '../../../Manager/Bloc/cipher_state.dart';
import '../../../Manager/Provider/app_settings_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<AppSettingsProvider>(context);
    final isRtl = settings.locale.languageCode == 'ar';

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'Assets/Images/Logo/logo.png',
            color: Colors.black,
            height: 130,
          ),
          centerTitle: true,
          actions: const [LanguageToggle()],
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const EncryptionType(),
                    const EncryptionSettings(),
                    const Input(),
                    const Output(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}