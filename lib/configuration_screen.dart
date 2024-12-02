import 'package:flutter/material.dart';

class ConfigurationScreen {
  static bool _isDarkMode = false; // Variable privada que almacena el estado del tema

  // Getter para acceder al estado del tema
  static bool get isDarkMode => _isDarkMode;

  // Setter para cambiar el estado del tema
  static set isDarkMode(bool value) {
    _isDarkMode = value;
  }

  // Método para alternar el tema
  static void toggleTheme() {
    _isDarkMode = !_isDarkMode;
  }

  // Método para obtener el tema actual
  static ThemeData get currentTheme {
    return _isDarkMode ? ThemeData.dark() : ThemeData.light();
  }
}
