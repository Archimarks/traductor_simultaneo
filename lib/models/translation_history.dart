/// Modelo que representa el historial de traducciones
class TranslationHistory {
  final String originalText; // Texto original
  final String translatedText; // Texto traducido
  final String fromLang; // Idioma de origen
  final String toLang; // Idioma de destino

  TranslationHistory({
    required this.originalText,
    required this.translatedText,
    required this.fromLang,
    required this.toLang,
  });
}
