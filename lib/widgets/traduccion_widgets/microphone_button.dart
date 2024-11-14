// lib/widgets/traduccion_widgets/microphone_button.dart
import 'package:flutter/material.dart';

class MicrophoneButton extends StatelessWidget {
  final bool isListening;
  final VoidCallback onStartListening;
  final VoidCallback onStopListening;

  const MicrophoneButton({
    super.key,
    required this.isListening,
    required this.onStartListening,
    required this.onStopListening,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isListening ? onStopListening : onStartListening,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isListening ? Colors.redAccent : Colors.blue,
          boxShadow: [
            BoxShadow(
              color: isListening ? Colors.red : Colors.blue,
              offset: const Offset(0, 4),
              blurRadius: 8.0,
            ),
          ],
        ),
        width: 80.0,
        height: 80.0,
        alignment: Alignment.center,
        child: Icon(
          isListening ? Icons.stop : Icons.mic,
          color: Colors.white,
          size: 40.0,
        ),
      ),
    );
  }
}
