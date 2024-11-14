import 'package:translator/translator.dart';

class TranslationService {
  final GoogleTranslator _translator =
      GoogleTranslator(); // Instancia del traductor

  // Traduce el texto del idioma de origen al idioma de destino
  Future<String> translateText(
      String text, String fromLang, String toLang) async {
    var translation = await _translator.translate(text,
        from: fromLang, to: toLang); // Realiza la traducción
    return translation.text; // Devuelve el texto traducido
  }
}
