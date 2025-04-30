import 'cipher_event.dart';

class CipherState {
  final String inputText;
  final String outputText;
  final int shift;
  final String key;
  final CipherType cipherType;
  final bool isProcessing;
  final String? error;

  CipherState({
    this.inputText = '',
    this.outputText = '',
    this.shift = 3,
    this.key = 'key',
    this.cipherType = CipherType.caesar,
    this.isProcessing = false,
    this.error,
  });

  CipherState copyWith({
    String? inputText,
    String? outputText,
    int? shift,
    String? key,
    CipherType? cipherType,
    bool? isProcessing,
    String? error,
  }) {
    return CipherState(
      inputText: inputText ?? this.inputText,
      outputText: outputText ?? this.outputText,
      shift: shift ?? this.shift,
      key: key ?? this.key,
      cipherType: cipherType ?? this.cipherType,
      isProcessing: isProcessing ?? this.isProcessing,
      error: error,
    );
  }
}