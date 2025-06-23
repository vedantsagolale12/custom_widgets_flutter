import 'package:flutter/material.dart';
import 'package:custom_widgets_flutter/enums/app_ui_enums.dart';

class AppBarColorConfig {
  static const Map<AppBarType, Color> _primaryColors = {
    AppBarType.primary: Color(0xFF2196F3),
    AppBarType.secondary: Color(0xFF757575),
    AppBarType.tertiary: Color(0xFF9C27B0),
    AppBarType.error: Color(0xFFE53E3E),
    AppBarType.success: Color(0xFF38A169),
    AppBarType.warning: Color(0xFFED8936),
    AppBarType.info: Color(0xFF3182CE),
    AppBarType.transparent: Colors.transparent,
    AppBarType.gradient: Color(0xFF2196F3),
    AppBarType.glass: Colors.white24,
  };

  static const Map<AppBarType, Color> _textColors = {
    AppBarType.primary: Colors.white,
    AppBarType.secondary: Colors.white,
    AppBarType.tertiary: Colors.white,
    AppBarType.error: Colors.white,
    AppBarType.success: Colors.white,
    AppBarType.warning: Colors.white,
    AppBarType.info: Colors.white,
    AppBarType.transparent: Colors.black87,
    AppBarType.gradient: Colors.white,
    AppBarType.glass: Colors.black87,
  };

  static Color getPrimaryColor(AppBarType type) => _primaryColors[type]!;
  static Color getTextColor(AppBarType type) => _textColors[type]!;
}
