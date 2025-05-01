import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Manager/Bloc/cipher_bloc.dart';
import '../../../Manager/Bloc/cipher_state.dart';
import '../../../l10n/l10n.dart';

class Output extends StatelessWidget {
  const Output({Key? key}) : super(key: key);

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
                  context.l10n.output,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    state.outputText.isEmpty
                        ? context.l10n.outputDisplayText
                        : state.outputText,
                    style: const TextStyle(fontSize: 16),
                    textDirection: _getTextDirection(state.outputText),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(

                  style: ButtonStyle(

                    iconColor: WidgetStatePropertyAll(Colors.black),
                  ),
                  onPressed:
                      state.outputText.isEmpty
                          ? null
                          : () {
                            Clipboard.setData(
                              ClipboardData(text: state.outputText),
                            ).then((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(context.l10n.copiedToClipboard),
                                ),
                              );
                            });
                          },
                  icon: const Icon(Icons.copy),
                  label: Text(context.l10n.copy , style: TextStyle(color: Colors.black),
                ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  TextDirection _getTextDirection(String text) {
    if (text.isEmpty) {
      return TextDirection.ltr;
    }

    // Simple heuristic to detect if the text is mostly Arabic
    int arabicChars = 0;
    for (int i = 0; i < text.length; i++) {
      int code = text.codeUnitAt(i);
      if (code >= 0x0600 && code <= 0x06FF) {
        // Arabic Unicode range
        arabicChars++;
      }
    }

    // If more than 30% of characters are Arabic, use RTL
    return (arabicChars > text.length * 0.3)
        ? TextDirection.rtl
        : TextDirection.ltr;
  }
}
