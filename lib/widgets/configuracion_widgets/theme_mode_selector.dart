import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traductor_simultaneo/main.dart';

class ThemeModeSelector extends StatefulWidget {
  const ThemeModeSelector({super.key});

  @override
  ThemeModeSelectorState createState() => ThemeModeSelectorState();
}

class ThemeModeSelectorState extends State<ThemeModeSelector> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  // Cargar la preferencia del tema almacenado
  void _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  // Guardar la preferencia del tema
  void _saveThemePreference(bool isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Modo oscuro'),
      value: _isDarkMode,
      onChanged: (bool value) {
        setState(() {
          _isDarkMode = value;
          _saveThemePreference(value);
          // Notifica al resto de la aplicación sobre el cambio
          if (_isDarkMode) {
            // Si está activado el modo oscuro
            MyApp.of(context)?.changeTheme(ThemeMode.dark);
          } else {
            // Si está desactivado (modo claro)
            MyApp.of(context)?.changeTheme(ThemeMode.light);
          }
        });
      },
    );
  }
}
