abstract class CipherEvent {}

class TextChanged extends CipherEvent {
  final String text;

  TextChanged(this.text);
}

class ShiftChanged extends CipherEvent {
  final int shift;

  ShiftChanged(this.shift);
}

class KeyChanged extends CipherEvent {
  final String key;

  KeyChanged(this.key);
}

class CipherTypeChanged extends CipherEvent {
  final CipherType type;

  CipherTypeChanged(this.type);
}

class ProcessText extends CipherEvent {
  final bool isEncrypt;

  ProcessText(this.isEncrypt);
}

enum CipherType { caesar, vigenere }
