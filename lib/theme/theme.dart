import 'package:flutter/material.dart';

// Definición de colores para el tema claro
const MaterialColor primaryColorLight = MaterialColor(
  0xFF2196F3, // Color principal
  <int, Color>{
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(0xFF2196F3),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  },
);

// Definición de colores para el tema oscuro
const MaterialColor primaryColorDark = MaterialColor(
  0xFF2196F3, // Color principal
  <int, Color>{
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(0xFF2196F3),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  },
);

// Tema claro
final ThemeData lightTheme = ThemeData(
  primarySwatch: primaryColorLight,
  colorScheme: const ColorScheme.light(
    primary: primaryColorLight,
    surface: Colors.white,
    onSurface: Colors.black,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF2196F3),
    foregroundColor: Colors.white,
  ),
);

// Tema oscuro
final ThemeData darkTheme = ThemeData(
  primarySwatch: primaryColorDark,
  colorScheme: const ColorScheme.dark(
    primary: primaryColorDark,
    surface: Color.fromARGB(90, 150, 150, 150),
    onSurface: Color.fromARGB(153, 255, 255, 255),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF2196F3),
    foregroundColor: Colors.white,
  ),
);
