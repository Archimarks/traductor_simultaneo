import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:traductor_simultaneo/pages/appbar/historial_page.dart'; // Importa la página de Historial
import 'package:traductor_simultaneo/pages/appbar/traduccion_page.dart'; // Importa la página de Traducción
import 'package:traductor_simultaneo/pages/appbar/configuraciones_page.dart'; // Importa la página de Configuraciones

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  // Lista de las páginas correspondientes a cada pestaña
  final List<Widget> _pages = [
    const HistorialPage(),
    const TraduccionPage(),
    const ConfiguracionesPage(),
  ];

  // Cambiar el índice cuando se selecciona una pestaña
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Traductor Simultáneo'),
        centerTitle: true, // Centra el título
      ),

      body: _pages[_selectedIndex], // Mostrar la página seleccionada
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react, // Agregar animación en la barra
        backgroundColor: Colors.blue,
        items: const [
          TabItem(icon: Icons.history, title: 'Historial'),
          TabItem(icon: Icons.mic, title: 'Traducción'),
          TabItem(icon: Icons.settings, title: 'Configuraciones'),
        ],
        initialActiveIndex: _selectedIndex, // Posición inicial
        onTap: _onItemTapped, // Cambiar la página al hacer clic
      ),
    );
  }
}
