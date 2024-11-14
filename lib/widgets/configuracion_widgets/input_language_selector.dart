import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputLanguageSelector extends StatefulWidget {
  const InputLanguageSelector({super.key});

  @override
  InputLanguageSelectorState createState() => InputLanguageSelectorState();
}

class InputLanguageSelectorState extends State<InputLanguageSelector> {
  String _selectedInputLanguage = 'es'; // Idioma predeterminado: Español

  @override
  void initState() {
    super.initState();
    _loadInputLanguagePreference();
  }

  // Cargar la preferencia de idioma almacenada
  void _loadInputLanguagePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedInputLanguage = prefs.getString('inputLanguage') ?? 'es';
    });
  }

  // Guardar la preferencia de idioma seleccionada
  void _saveInputLanguagePreference(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('inputLanguage', language);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // Centra el contenido
      child: SizedBox(
        width: MediaQuery.of(context).size.width *
            0.3, // Establece el ancho relativo a la pantalla
        child: DropdownButton<String>(
          value: _selectedInputLanguage,
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
              _selectedInputLanguage = newValue!;
              _saveInputLanguagePreference(newValue);
            });
          },
          hint: const Text('Selecciona el idioma de entrada'),
        ),
      ),
    );
  }
}
