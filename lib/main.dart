import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; //
import './pages/home_screen.dart'; // Asegúrate de que esta ruta sea correcta
import './theme/theme.dart'; // Importa el archivo theme.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static MyAppState? of(BuildContext context) => context.findAncestorStateOfType<MyAppState>();

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  // Cargar la preferencia almacenada al iniciar la aplicación
  void _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  // Método para cambiar el tema dinámicamente
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Traductor Simultáneo',
      theme: lightTheme, // Tema claro
      darkTheme: darkTheme, // Tema oscuro
      themeMode: _themeMode, // Cambia dinámicamente según la preferencia
      home: const HomeScreen(),
    );
  }
}
