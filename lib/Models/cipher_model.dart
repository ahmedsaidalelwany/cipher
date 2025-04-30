class CipherModel {
  final String originalText;
  final String processedText;
  final int shift;
  final bool isEncrypt;

  CipherModel({
    required this.originalText,
    required this.processedText,
    required this.shift,
    required this.isEncrypt,
  });

  CipherModel copyWith({
    String? originalText,
    String? processedText,
    int? shift,
    bool? isEncrypt,
  }) {
    return CipherModel(
      originalText: originalText ?? this.originalText,
      processedText: processedText ?? this.processedText,
      shift: shift ?? this.shift,
      isEncrypt: isEncrypt ?? this.isEncrypt,
    );
  }
}