import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Manager/Bloc/cipher_bloc.dart';
import '../../../Manager/Bloc/cipher_event.dart';
import '../../../Manager/Bloc/cipher_state.dart';
import '../../../l10n/l10n.dart';

class EncryptionType extends StatelessWidget {
  const EncryptionType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CipherBloc, CipherState>(
      builder: (context, state) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.encryptionType,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<CipherType>(
                        activeColor: Colors.black,
                        title: Text(
                          context.l10n.caesar,
                          style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: CipherType.caesar,
                        groupValue: state.cipherType,
                        onChanged: (value) {
                          context.read<CipherBloc>().add(
                            CipherTypeChanged(value!),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<CipherType>(
                        activeColor: Colors.black,
                        title: Text(
                          context.l10n.vigenere,
                          style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: CipherType.vigenere,
                        groupValue: state.cipherType,
                        onChanged: (value) {
                          context.read<CipherBloc>().add(
                            CipherTypeChanged(value!),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}