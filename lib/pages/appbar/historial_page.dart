// historial_page.dart

import 'package:flutter/material.dart';
import 'package:traductor_simultaneo/widgets/historial_widgets/historial_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HistorialPage extends StatefulWidget {
  const HistorialPage({super.key});

  @override
  HistorialPageState createState() => HistorialPageState();
}

class HistorialPageState extends State<HistorialPage> {
  List<Map<String, String>> historial = []; // Historial de traducciones

  @override
  void initState() {
    super.initState();
    _loadHistorial(); // Cargar el historial al iniciar la página
  }

  void _loadHistorial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedHistorial = prefs.getString('historial');

    if (savedHistorial != null) {
      List<dynamic> loadedHistorial = jsonDecode(savedHistorial);

      setState(() {
        // Convertimos cada ítem del historial a Map<String, String> y cargamos los idiomas
        historial = loadedHistorial.map((item) {
          return Map<String, String>.from(item as Map);
        }).toList();
      });
    }
  }

  // Guardar el historial en SharedPreferences
  void _saveHistorial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('historial', jsonEncode(historial));
  }

  // Limpiar todo el historial
  void _clearAllHistorial() {
    setState(() {
      historial.clear();
    });
    _saveHistorial();
  }

  // Eliminar un solo registro del historial
  void _deleteHistorialItem(int index) {
    setState(() {
      historial.removeAt(index);
    });
    _saveHistorial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: historial.isEmpty
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history, size: 100, color: Colors.grey),
                  SizedBox(height: 20),
                  Text(
                    'No hay historial disponible.',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            : HistorialList(
                historial: historial,
                onClearAll: _clearAllHistorial,
                onDelete: _deleteHistorialItem,
              ),
      ),
    );
  }
}
