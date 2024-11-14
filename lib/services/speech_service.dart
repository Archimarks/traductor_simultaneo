import 'package:speech_to_text/speech_to_text.dart';

class SpeechService {
  final SpeechToText _speech = SpeechToText(); // Instancia del servicio de reconocimiento de voz

  // Inicializa el servicio de reconocimiento de voz
  Future<void> initialize() async {
    await _speech.initialize(); // Inicializa la API de SpeechToText
  }

  // Inicia la escucha y pasa el texto reconocido al callback
  Future<void> startListening(Function(String) onResult) async {
    _speech.listen(
      onResult: (result) {
        if (result.recognizedWords.isNotEmpty) {
          onResult(result.recognizedWords); // Devuelve palabras reconocidas parciales
        }
      },
      // ignore: deprecated_member_use
      partialResults: true, // Permitir resultados parciales
      listenFor: const Duration(minutes: 5), // Aumenta el tiempo de escucha si es necesario
    );
  }

  // Detiene la escucha
  Future<void> stopListening() async {
    await _speech.stop(); // Detiene el reconocimiento de voz
  }
}
