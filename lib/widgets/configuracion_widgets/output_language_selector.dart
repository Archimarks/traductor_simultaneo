import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OutputLanguageSelector extends StatefulWidget {
  const OutputLanguageSelector({super.key});

  @override
  OutputLanguageSelectorState createState() => OutputLanguageSelectorState();
}

class OutputLanguageSelectorState extends State<OutputLanguageSelector> {
  String _selectedOutputLanguage = 'en'; // Idioma predeterminado: Inglés

  @override
  void initState() {
    super.initState();
    _loadOutputLanguagePreference();
  }

  // Cargar la preferencia de idioma de salida almacenada
  void _loadOutputLanguagePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedOutputLanguage = prefs.getString('outputLanguage') ?? 'en';
    });
  }

  // Guardar la preferencia de idioma de salida seleccionada
  void _saveOutputLanguagePreference(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('outputLanguage', language);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // Centra el contenido
      child: SizedBox(
        width: MediaQuery.of(context).size.width *
            0.3, // Establece el ancho relativo a la pantalla
        child: DropdownButton<String>(
          value: _selectedOutputLanguage,
          isExpanded:
              true, // Asegura que el DropdownButton ocupe el ancho completo del contenedor
          items: const [
            DropdownMenuItem(
              value: 'es',
              child: Center(child: Text('Español')),
            ),
            DropdownMenuItem(
              value: 'en',
              child: Center(child: Text('Inglés')),
            ),
            DropdownMenuItem(
              value: 'fr',
              child: Center(child: Text('Francés')),
            ),
            DropdownMenuItem(
              value: 'de',
              child: Center(child: Text('Alemán')),
            ),
            DropdownMenuItem(
              value: 'pt',
              child: Center(child: Text('Portugués')),
            ),
            DropdownMenuItem(
              value: 'it',
              child: Center(child: Text('Italiano')),
            ),
            DropdownMenuItem(
              value: 'ja',
              child: Center(child: Text('Japonés')),
            ),
            DropdownMenuItem(
              value: 'ar',
              child: Center(child: Text('Árabe')),
            ),
            DropdownMenuItem(
              value: 'zh',
              child: Center(child: Text('Chino')),
            ),
          ],
          onChanged: (String? newValue) {
            setState(() {
              _selectedOutputLanguage = newValue!;
              _saveOutputLanguagePreference(newValue);
            });
          },
          hint: const Text('Selecciona el idioma de traducción'),
        ),
      ),
    );
  }
}
