class CipherService {
  // الحروف العربية مرتبة
  static const String arabicAlphabet = 'ابتثجحخدذرزسشصضطظعغفقكلمنهوي';

  static String caesarCipher(String text, int shift, bool encrypt) {
    if (text.isEmpty) return '';

    if (!encrypt) {
      shift = -shift;
    }

    final int englishShift = shift % 26;
    final int arabicShift = shift % arabicAlphabet.length;

    final StringBuffer result = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      final int charCode = text.codeUnitAt(i);
      final String currentChar = text[i];

      if (charCode >= 65 && charCode <= 90) {
        int newCharCode = ((charCode - 65 + englishShift) % 26) + 65;
        result.write(String.fromCharCode(newCharCode));
      } else if (charCode >= 97 && charCode <= 122) {
        int newCharCode = ((charCode - 97 + englishShift) % 26) + 97;
        result.write(String.fromCharCode(newCharCode));
      } else if (_isArabicLetter(currentChar)) {
        int arabicIndex = arabicAlphabet.indexOf(currentChar);
        if (arabicIndex != -1) {
          int newIndex = (arabicIndex + arabicShift) % arabicAlphabet.length;
          if (newIndex < 0) newIndex += arabicAlphabet.length;
          result.write(arabicAlphabet[newIndex]);
        } else {
          result.write(currentChar);
        }
      } else {
        result.write(currentChar);
      }
    }

    return result.toString();
  }

  static String vigenereCipher(String text, String key, bool encrypt) {
    if (text.isEmpty || key.isEmpty) return '';

    final StringBuffer result = StringBuffer();
    int keyIndex = 0;

    List<int> shifts = [];
    for (int i = 0; i < key.length; i++) {
      int charCode = key.codeUnitAt(i);
      int shift = 0;

      if (charCode >= 65 && charCode <= 90) {
        shift = charCode - 65;
      } else if (charCode >= 97 && charCode <= 122) {
        shift = charCode - 97;
      } else if (_isArabicLetter(key[i])) {
        shift = arabicAlphabet.indexOf(key[i]);
        if (shift == -1) shift = 0;
      }

      shifts.add(shift);
    }

    for (int i = 0; i < text.length; i++) {
      final String currentChar = text[i];
      final int charCode = text.codeUnitAt(i);

      bool isLetter = false;

      int shift = shifts[keyIndex % shifts.length];
      if (!encrypt) {
        shift = -shift;
      }

      if (charCode >= 65 && charCode <= 90) {
        int newCharCode = ((charCode - 65 + shift) % 26);
        if (newCharCode < 0) newCharCode += 26;
        result.write(String.fromCharCode(newCharCode + 65));
        isLetter = true;
      } else if (charCode >= 97 && charCode <= 122) {
        int newCharCode = ((charCode - 97 + shift) % 26);
        if (newCharCode < 0) newCharCode += 26;
        result.write(String.fromCharCode(newCharCode + 97));
        isLetter = true;
      } else if (_isArabicLetter(currentChar)) {
        int arabicIndex = arabicAlphabet.indexOf(currentChar);
        if (arabicIndex != -1) {
          int newIndex = (arabicIndex + shift) % arabicAlphabet.length;
          if (newIndex < 0) newIndex += arabicAlphabet.length;
          result.write(arabicAlphabet[newIndex]);
          isLetter = true;
        } else {
          result.write(currentChar);
        }
      } else {
        result.write(currentChar);
      }

      if (isLetter) {
        keyIndex++;
      }
    }

    return result.toString();
  }

  static bool _isArabicLetter(String char) {
    if (char.length != 1) return false;
    int code = char.codeUnitAt(0);

    return (code >= 0x0621 && code <= 0x064A);
  }
}
