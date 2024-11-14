import 'package:flutter/material.dart';
import 'package:traductor_simultaneo/widgets/historial_widgets/historial_item.dart';

class HistorialList extends StatefulWidget {
  final List<Map<String, String>> historial;
  final VoidCallback onClearAll;
  final Function(int) onDelete;

  const HistorialList({
    super.key,
    required this.historial,
    required this.onClearAll,
    required this.onDelete,
  });

  @override
  HistorialListState createState() => HistorialListState();
}

class HistorialListState extends State<HistorialList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AnimatedList(
            key: _listKey,
            initialItemCount: widget.historial.length,
            itemBuilder: (context, index, animation) {
              final item = widget.historial[index];
              return SlideTransition(
                position: animation.drive(
                  Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                      .chain(CurveTween(curve: Curves.easeInOut)),
                ),
                child: HistorialItem(
                  originalText: item['original']!,
                  translatedText: item['translated']!,
                  fromLanguage: item['fromLanguage']!,
                  toLanguage: item['toLanguage']!,
                  onDelete: () => _deleteItem(index),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: widget.onClearAll,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal, // Color de fondo más agradable
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Bordes redondeados
              ),
              elevation: 5, // Sombras más suaves
            ),
            child: const Text(
              'Limpiar Todo el Historial',
              style: TextStyle(
                color: Colors.white, // Texto blanco para mayor contraste
                fontSize: 16, // Tamaño de fuente más legible
                fontWeight: FontWeight.bold, // Texto en negrita
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Eliminar un ítem con animación
  void _deleteItem(int index) {
    final removedItem = widget.historial[index];
    widget.onDelete(index);
    _listKey.currentState!.removeItem(
      index,
      (context, animation) => SlideTransition(
        position: animation.drive(
          Tween<Offset>(begin: Offset.zero, end: const Offset(1, 0)),
        ),
        child: HistorialItem(
          originalText: removedItem['original']!,
          translatedText: removedItem['translated']!,
          fromLanguage: removedItem['fromLanguage']!,
          toLanguage: removedItem['toLanguage']!,
          onDelete: () {},
        ),
      ),
      duration: const Duration(milliseconds: 300),
    );
  }
}
