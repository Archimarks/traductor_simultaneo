//traduccion_page.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:traductor_simultaneo/services/speech_service.dart';
import 'package:traductor_simultaneo/services/translation_service.dart';
import 'package:traductor_simultaneo/widgets/traduccion_widgets/microphone_button.dart';
import 'package:traductor_simultaneo/widgets/traduccion_widgets/transcription_display.dart';
import 'package:traductor_simultaneo/widgets/traduccion_widgets/translation_display.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TraduccionPage extends StatefulWidget {
  const TraduccionPage({super.key});

  @override
  TraduccionPageState createState() => TraduccionPageState();
}

class TraduccionPageState extends State<TraduccionPage> {
  String recognizedText = ''; // Texto reconocido
  String translatedText = ''; // Texto traducido
  bool isListening = false; // Estado de escucha
  String selectedListeningLang = 'es'; // Idioma de escucha predeterminado
  String selectedTranslationLang = 'en'; // Idioma de traducción predeterminado
  String fullRecognizedText = ''; // Texto completo reconocido
  String fullTranslatedText = ''; // Texto completo traducido

  final SpeechService _speechService = SpeechService(); // Servicio de reconocimiento de voz
  final TranslationService _translationService = TranslationService(); // Servicio de traducción

  @override
  void initState() {
    super.initState();
    _speechService.initialize(); // Inicializa el servicio de voz
    _loadLanguagePreferences(); // Carga las preferencias de idioma
  }

  // Carga las preferencias de idioma de entrada y salida
  void _loadLanguagePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedListeningLang = prefs.getString('inputLanguage') ?? 'es';
      selectedTranslationLang = prefs.getString('outputLanguage') ?? 'en';
    });
  }

  void _startListening() async {
    setState(() => isListening = true); // Cambia el estado a "escuchando"

    // Resetea los textos acumulados al comenzar a escuchar
    fullRecognizedText = '';
    fullTranslatedText = '';

    // Inicia el reconocimiento de voz y procesa fragmentos de texto en tiempo real
    await _speechService.startListening((text) async {
      setState(() {
        recognizedText = text; // Actualiza el texto reconocido en tiempo real
        fullRecognizedText += ' $text'; // Acumula el texto completo
      });

      // Traduce el texto fragmentado conforme se reconoce
      String translation = await _translationService.translateText(
        text, // Traduce el fragmento reconocido
        selectedListeningLang,
        selectedTranslationLang,
      );

      setState(() {
        translatedText = translation; // Actualiza el texto traducido en tiempo real
        fullTranslatedText += ' $translation'; // Acumula la traducción completa
      });
    });
  }

  void _stopListening() async {
    setState(() => isListening = false); // Cambia el estado a "no escuchando"
    await _speechService.stopListening(); // Detiene la escucha

    // Guarda el historial completo
    _addToHistorial(fullRecognizedText, fullTranslatedText);
  }

  void _addToHistorial(String originalText, String translatedText) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedHistorial = prefs.getString('historial');

    List<dynamic> historial = savedHistorial != null ? jsonDecode(savedHistorial) : [];

    // Añadimos el nuevo ítem de historial con los idiomas seleccionados
    historial.add({
      'original': originalText,
      'translated': translatedText,
      'fromLanguage': selectedListeningLang, // Idioma de origen
      'toLanguage': selectedTranslationLang, // Idioma de destino
    });

    // Guardamos el historial actualizado en SharedPreferences
    prefs.setString('historial', jsonEncode(historial));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MicrophoneButton(
              isListening: isListening,
              onStartListening: _startListening,
              onStopListening: _stopListening,
            ),
            const SizedBox(height: 20),
            TranscriptionDisplay(recognizedText: recognizedText),
            const SizedBox(height: 20),
            TranslationDisplay(translatedText: translatedText),
          ],
        ),
      ),
    );
  }
}
