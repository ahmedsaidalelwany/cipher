import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Service/cipher_service.dart';
import 'cipher_event.dart';
import 'cipher_state.dart';

class CipherBloc extends Bloc<CipherEvent, CipherState> {
  final CipherService _cipherService = CipherService();

  CipherBloc() : super(CipherState()) {
    on<TextChanged>(_onTextChanged);
    on<ShiftChanged>(_onShiftChanged);
    on<KeyChanged>(_onKeyChanged);
    on<CipherTypeChanged>(_onCipherTypeChanged);
    on<ProcessText>(_onProcessText);
  }

  void _onTextChanged(TextChanged event, Emitter<CipherState> emit) {
    emit(state.copyWith(inputText: event.text));
  }

  void _onShiftChanged(ShiftChanged event, Emitter<CipherState> emit) {
    emit(state.copyWith(shift: event.shift));
  }

  void _onKeyChanged(KeyChanged event, Emitter<CipherState> emit) {
    emit(state.copyWith(key: event.key));
  }

  void _onCipherTypeChanged(CipherTypeChanged event, Emitter<CipherState> emit) {
    emit(state.copyWith(cipherType: event.type));
  }

  void _onProcessText(ProcessText event, Emitter<CipherState> emit) {
    final inputText = state.inputText;

    if (inputText.isEmpty) {
      emit(state.copyWith(error: 'Please enter text to process'));
      return;
    }

    emit(state.copyWith(isProcessing: true));

    try {
      String result;
      if (state.cipherType == CipherType.caesar) {
        result = CipherService.caesarCipher(inputText, state.shift, event.isEncrypt);
      } else {
        if (state.key.isEmpty) {
          emit(state.copyWith(
            isProcessing: false,
            error: 'Please enter a key for Vigenere cipher',
          ));
          return;
        }
        result = CipherService.vigenereCipher(inputText, state.key, event.isEncrypt);
      }

      emit(state.copyWith(
        outputText: result,
        isProcessing: false,
        error: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        isProcessing: false,
        error: 'Error:  ${e.toString()}',
      ));
    }
  }
}