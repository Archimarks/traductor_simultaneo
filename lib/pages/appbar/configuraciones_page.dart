import 'package:flutter/material.dart';
import 'package:traductor_simultaneo/widgets/configuracion_widgets/theme_mode_selector.dart'; // Importa el selector
import 'package:traductor_simultaneo/widgets/configuracion_widgets/input_language_selector.dart'; // Importa el selector de idioma de entrada
import 'package:traductor_simultaneo/widgets/configuracion_widgets/output_language_selector.dart'; // Importa el selector de idioma de salida

class ConfiguracionesPage extends StatelessWidget {
  const ConfiguracionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 100, color: Colors.green),
          SizedBox(height: 20),
          Text(
            'Página de Configuraciones',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Ajusta tus preferencias aquí.',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          ThemeModeSelector(), // Incluye el selector de modo de tema
          SizedBox(height: 20),

          // Sección de idioma de entrada con encabezado
          Text(
            'Selecciona el idioma en el que vas a hablar',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // Distribución horizontal
            children: [
              Expanded(
                child: Text(
                  'IDIOMA DE ENTRADA',
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: InputLanguageSelector(), // Selector de idioma de entrada
              ),
            ],
          ),
          SizedBox(height: 20), // Espacio entre las dos secciones

          // Sección de idioma de salida con encabezado
          Text(
            'Selecciona el idioma al que deseas traducir',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly, // Distribución horizontal
            children: [
              Expanded(
                child: Text(
                  'IDIOMA DE SALIDA',
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: OutputLanguageSelector(), // Selector de idioma de salida
              ),
            ],
          ),
          SizedBox(
              height: 20), // Espacio final para asegurar la buena distribución
        ],
      ),
    );
  }
}
