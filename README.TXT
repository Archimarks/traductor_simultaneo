## Project Structure

TRADUCTOR_SIMULTANEO/
│
└── lib/     
    ├── models
    │   ├── translation_history.dart
    │   └── translation.dart   
    │
    ├── pages
    │   ├── appbar
    │   │    ├── configuraciones_page.dart
    │   │    ├── historial_page.dart
    │   │    └── traduccion_page.dart
    │   └── home_screen.dart
    │
    │
    ├── services
    │   ├── speech_service.dart
    │   └── translation_service.dart
    │
    │
    ├── theme
    │   └── theme.dart
    │
    │
    └── widgets
        ├── configuracion_widgets
        │    ├── input_language_selector.dart
        │    ├── output_language_selector.dart
        │    └── theme_mode_selector.dart
        │
        │
        ├── historial_widgets
        │    ├── historial_item.dart
        │    └── historial_list.dart
        │
        │
        └── traduccion_widgets
             ├── microphone_button.dart
             ├── transcription_display.dart
             └── translation_display.dart