import 'package:custom_widgets_flutter/enums/app_ui_enums.dart';
import 'package:flutter/material.dart';

/// Helper class for handling AppThemeMode logic
abstract class AppThemeModeHelper {
  /// Converts custom AppThemeMode to Flutter's built-in ThemeMode
  static ThemeMode toFlutterThemeMode(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.system:
        return ThemeMode.system;
      // For custom themes, default to light (or handle separately)
      case AppThemeMode.highContrast:
      case AppThemeMode.sepia:
        return ThemeMode.light;
    }
  }

  /// Returns the actual ThemeData based on the custom AppThemeMode
  static ThemeData getThemeData(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.dark:
        return ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white),
          ),
          brightness: Brightness.dark,
        );

      // high constrast not available create a custom color theme file for styling !
      case AppThemeMode.highContrast:
        return ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.yellowAccent),
          ),
        );

      case AppThemeMode.sepia:
        return ThemeData.light().copyWith(
          scaffoldBackgroundColor: const Color(0xFFF5E9DA),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Color(0xFF704214)), // Brownish text
          ),
        );

      case AppThemeMode.light:
      default:
        return ThemeData.light();
    }
  }

  /// Returns a readable label for UI dropdowns etc.
  static String getLabel(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return "Light";
      case AppThemeMode.dark:
        return "Dark";
      case AppThemeMode.system:
        return "System";
      case AppThemeMode.highContrast:
        return "High Contrast";
      case AppThemeMode.sepia:
        return "Sepia";
    }
  }

  /// Returns icon for each mode (for UI representation)
  static IconData getIcon(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return Icons.wb_sunny;
      case AppThemeMode.dark:
        return Icons.nightlight_round;
      case AppThemeMode.system:
        return Icons.settings;
      case AppThemeMode.highContrast:
        return Icons.contrast;
      case AppThemeMode.sepia:
        return Icons.emoji_objects;
    }
  }
}
