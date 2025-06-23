import 'package:custom_widgets_flutter/enums/app_ui_enums.dart';
import 'package:flutter/material.dart';

class ButtonSizeConfig {
  static const Map<ButtonSize, EdgeInsets> _padding = {
    ButtonSize.mini: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    ButtonSize.small: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    ButtonSize.medium: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ButtonSize.large: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    ButtonSize.extraLarge: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
  };

  static const Map<ButtonSize, double> _fontSize = {
    ButtonSize.mini: 10,
    ButtonSize.small: 12,
    ButtonSize.medium: 14,
    ButtonSize.large: 16,
    ButtonSize.extraLarge: 18,
  };

  static const Map<ButtonSize, double> _iconSize = {
    ButtonSize.mini: 16,
    ButtonSize.small: 18,
    ButtonSize.medium: 20,
    ButtonSize.large: 24,
    ButtonSize.extraLarge: 28,
  };

  static EdgeInsets getPadding(ButtonSize size) => _padding[size]!;
  static double getFontSize(ButtonSize size) => _fontSize[size]!;
  static double getIconSize(ButtonSize size) => _iconSize[size]!;
}
