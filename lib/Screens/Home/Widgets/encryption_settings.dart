import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Manager/Bloc/cipher_bloc.dart';
import '../../../Manager/Bloc/cipher_event.dart';
import '../../../Manager/Bloc/cipher_state.dart';
import '../../../l10n/l10n.dart';

class EncryptionSettings extends StatelessWidget {
  const EncryptionSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CipherBloc, CipherState>(
      builder: (context, state) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.encryptionSettings,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 16),
                if (state.cipherType == CipherType.caesar) ...[
                  Text(
                    context.l10n.shift(state.shift),
                    style: const TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Slider(
                    activeColor: Colors.black,
                    value: state.shift.toDouble(),
                    min: 1,
                    max: 25,
                    divisions: 24,
                    label: state.shift.toString(),
                    onChanged: (value) {
                      context.read<CipherBloc>().add(
                        ShiftChanged(value.toInt()),
                      );
                    },
                  ),
                ] else ...[
                  TextField(
                    controller: TextEditingController(text: state.key),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      labelText: context.l10n.key,
                      labelStyle: const TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      hintText: context.l10n.enterKey,
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      context.read<CipherBloc>().add(KeyChanged(value));
                    },
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}