class CipherService {
  // الحروف العربية مرتبة
  static const String arabicAlphabet = 'ابتثجحخدذرزسشصضطظعغفقكلمنهوي';

  static String caesarCipher(String text, int shift, bool encrypt) {
    if (text.isEmpty) return '';

    if (!encrypt) {
      shift = -shift;
    }

    // تعديل الإزاحة لتكون ضمن النطاق المطلوب للأبجدية المستخدمة
    final int englishShift = shift % 26;
    final int arabicShift = shift % arabicAlphabet.length;

    final StringBuffer result = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      final int charCode = text.codeUnitAt(i);
      final String currentChar = text[i];

      // التحقق ما إذا كان الحرف إنجليزي
      if (charCode >= 65 && charCode <= 90) {  // حروف إنجليزية كبيرة
        int newCharCode = ((charCode - 65 + englishShift) % 26) + 65;
        result.write(String.fromCharCode(newCharCode));
      }
      else if (charCode >= 97 && charCode <= 122) {  // حروف إنجليزية صغيرة
        int newCharCode = ((charCode - 97 + englishShift) % 26) + 97;
        result.write(String.fromCharCode(newCharCode));
      }
      // التحقق ما إذا كان الحرف عربي
      else if (_isArabicLetter(currentChar)) {
        int arabicIndex = arabicAlphabet.indexOf(currentChar);
        if (arabicIndex != -1) {
          int newIndex = (arabicIndex + arabicShift) % arabicAlphabet.length;
          if (newIndex < 0) newIndex += arabicAlphabet.length;
          result.write(arabicAlphabet[newIndex]);
        } else {
          // إذا لم يتم العثور على الحرف في الأبجدية العربية، نتركه كما هو
          result.write(currentChar);
        }
      }
      else {
        // أي حرف آخر يبقى كما هو (أرقام، علامات ترقيم، مسافات، إلخ)
        result.write(currentChar);
      }
    }

    return result.toString();
  }

  static String vigenereCipher(String text, String key, bool encrypt) {
    if (text.isEmpty || key.isEmpty) return '';

    final StringBuffer result = StringBuffer();
    int keyIndex = 0;

    // تحويل مفتاح التشفير إلى قائمة من قيم الإزاحة
    List<int> shifts = [];
    for (int i = 0; i < key.length; i++) {
      int charCode = key.codeUnitAt(i);
      int shift = 0;

      if (charCode >= 65 && charCode <= 90) {  // إنجليزي كبير
        shift = charCode - 65;
      } else if (charCode >= 97 && charCode <= 122) {  // إنجليزي صغير
        shift = charCode - 97;
      } else if (_isArabicLetter(key[i])) {  // عربي
        shift = arabicAlphabet.indexOf(key[i]);
        if (shift == -1) shift = 0;
      }

      shifts.add(shift);
    }

    for (int i = 0; i < text.length; i++) {
      final String currentChar = text[i];
      final int charCode = text.codeUnitAt(i);

      // نستخدم فقط الحروف لتحريك مؤشر المفتاح
      bool isLetter = false;

      int shift = shifts[keyIndex % shifts.length];
      if (!encrypt) {
        shift = -shift;
      }

      // التحقق ما إذا كان الحرف إنجليزي
      if (charCode >= 65 && charCode <= 90) {  // حروف إنجليزية كبيرة
        int newCharCode = ((charCode - 65 + shift) % 26);
        if (newCharCode < 0) newCharCode += 26;
        result.write(String.fromCharCode(newCharCode + 65));
        isLetter = true;
      }
      else if (charCode >= 97 && charCode <= 122) {  // حروف إنجليزية صغيرة
        int newCharCode = ((charCode - 97 + shift) % 26);
        if (newCharCode < 0) newCharCode += 26;
        result.write(String.fromCharCode(newCharCode + 97));
        isLetter = true;
      }
      // التحقق ما إذا كان الحرف عربي
      else if (_isArabicLetter(currentChar)) {
        int arabicIndex = arabicAlphabet.indexOf(currentChar);
        if (arabicIndex != -1) {
          int newIndex = (arabicIndex + shift) % arabicAlphabet.length;
          if (newIndex < 0) newIndex += arabicAlphabet.length;
          result.write(arabicAlphabet[newIndex]);
          isLetter = true;
        } else {
          result.write(currentChar);
        }
      }
      else {
        // أي حرف آخر يبقى كما هو
        result.write(currentChar);
      }

      // نزيد مؤشر المفتاح فقط إذا كان الحرف الحالي حرفًا
      if (isLetter) {
        keyIndex++;
      }
    }

    return result.toString();
  }

  // دالة للتحقق ما إذا كان الحرف عربيًا
  static bool _isArabicLetter(String char) {
    if (char.length != 1) return false;
    int code = char.codeUnitAt(0);
    // نطاق الحروف العربية الأساسية من 0x0621 إلى 0x064A
    return (code >= 0x0621 && code <= 0x064A);
  }
}