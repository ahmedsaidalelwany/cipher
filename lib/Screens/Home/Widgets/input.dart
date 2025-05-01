import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Manager/Bloc/cipher_bloc.dart';
import '../../../Manager/Bloc/cipher_event.dart';
import '../../../Manager/Bloc/cipher_state.dart';
import '../../../l10n/l10n.dart';

class Input extends StatelessWidget {
  const Input({Key? key}) : super(key: key);

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
                  context.l10n.enterText,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 8),
                TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),

fillColor: Colors.black,
                    hintText: context.l10n.writeTextHere,
                    border: const OutlineInputBorder(

                    ),
                  ),
                  maxLines: 5,
                  textAlign: TextAlign.start,
                  textDirection: _getTextDirection(context),
                  onChanged: (value) {
                    context.read<CipherBloc>().add(
                      TextChanged(value),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: state.isProcessing
                            ? null
                            : () {
                          context.read<CipherBloc>().add(
                            ProcessText(true),
                          );
                        },
                        child: Text(
                          context.l10n.encrypt,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: state.isProcessing
                            ? null
                            : () {
                          context.read<CipherBloc>().add(
                            ProcessText(false),
                          );
                        },
                        child: Text(
                          context.l10n.decrypt,
                          style: const TextStyle(color: Colors.black),
                        ),
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

  TextDirection _getTextDirection(BuildContext context) {
    // Auto detect based on first entered character
    // For simplicity, we'll base it on the current locale
    final locale = Localizations.localeOf(context);
    return locale.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr;
  }
}