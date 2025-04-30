class CipherService {
  static String caesarCipher(String text, int shift, bool encrypt) {
    if (text.isEmpty) return '';

    if (!encrypt) {
      shift = -shift;
    }

    shift = shift % 26;

    final StringBuffer result = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      int charCode = text.codeUnitAt(i);

      if (charCode >= 65 && charCode <= 90) {
        charCode = ((charCode - 65 + shift) % 26) + 65;
      }
      else if (charCode >= 97 && charCode <= 122) {
        charCode = ((charCode - 97 + shift) % 26) + 97;
      }
      else if (charCode >= 0x0621 && charCode <= 0x064A) {
        charCode = ((charCode - 0x0621 + shift) % 42) + 0x0621;
      }

      result.write(String.fromCharCode(charCode));
    }

    return result.toString();
  }

  static String vigenereCipher(String text, String key, bool encrypt) {
    if (text.isEmpty || key.isEmpty) return '';

    final StringBuffer result = StringBuffer();
    int keyIndex = 0;

    for (int i = 0; i < text.length; i++) {
      int charCode = text.codeUnitAt(i);
      int keyChar = key.codeUnitAt(keyIndex % key.length);

      int shift = 0;
      if (keyChar >= 65 && keyChar <= 90) {
        shift = keyChar - 65;
      } else if (keyChar >= 97 && keyChar <= 122) {
        shift = keyChar - 97;
      }

      if (!encrypt) {
        shift = -shift;
      }

      if (charCode >= 65 && charCode <= 90) {
        charCode = ((charCode - 65 + shift) % 26);
        if (charCode < 0) charCode += 26;
        charCode += 65;
        keyIndex++;
      }
      else if (charCode >= 97 && charCode <= 122) {
        charCode = ((charCode - 97 + shift) % 26);
        if (charCode < 0) charCode += 26;
        charCode += 97;
        keyIndex++;
      }
      else if (charCode >= 0x0621 && charCode <= 0x064A) {
        charCode = ((charCode - 0x0621 + shift) % 42);
        if (charCode < 0) charCode += 42;
        charCode += 0x0621;
        keyIndex++;
      }

      result.write(String.fromCharCode(charCode));
    }

    return result.toString();
  }
}