import 'package:custom_widgets_flutter/enums/app_ui_enums.dart';
import 'package:flutter/material.dart';

class ButtonColorConfig {
  static const Map<ButtonType, Color> _primaryColors = {
    ButtonType.primary: Color(0xFF2196F3),
    ButtonType.secondary: Color(0xFF757575),
    ButtonType.tertiary: Color(0xFF9C27B0),
    ButtonType.error: Color(0xFFE53E3E),
    ButtonType.success: Color(0xFF38A169),
    ButtonType.warning: Color(0xFFED8936),
    ButtonType.info: Color(0xFF3182CE),
    ButtonType.outline: Color(0xFF2196F3),
    ButtonType.ghost: Colors.transparent,
    ButtonType.link: Color(0xFF2196F3),
    ButtonType.floating: Color(0xFF2196F3),
    ButtonType.icon: Color(0xFF2196F3),
  };

  static const Map<ButtonType, Color> _textColors = {
    ButtonType.primary: Colors.white,
    ButtonType.secondary: Colors.white,
    ButtonType.tertiary: Colors.white,
    ButtonType.error: Colors.white,
    ButtonType.success: Colors.white,
    ButtonType.warning: Colors.white,
    ButtonType.info: Colors.white,
    ButtonType.outline: Color(0xFF2196F3),
    ButtonType.ghost: Color(0xFF2196F3),
    ButtonType.link: Color(0xFF2196F3),
    ButtonType.floating: Colors.white,
    ButtonType.icon: Color(0xFF2196F3),
  };

  static Color getPrimaryColor(ButtonType type) => _primaryColors[type]!;
  static Color getTextColor(ButtonType type) => _textColors[type]!;
}
