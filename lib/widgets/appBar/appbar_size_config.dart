import 'package:custom_widgets_flutter/enums/app_ui_enums.dart';

class AppBarSizeConfig {
  static const Map<AppBarSize, double> _heights = {
    AppBarSize.mini: 40,
    AppBarSize.small: 50,
    AppBarSize.medium: 56, // Default AppBar height
    AppBarSize.large: 80,
    AppBarSize.extraLarge: 100,
  };

  static const Map<AppBarSize, double> _fontSize = {
    AppBarSize.mini: 14,
    AppBarSize.small: 16,
    AppBarSize.medium: 18,
    AppBarSize.large: 20,
    AppBarSize.extraLarge: 22,
  };

  static const Map<AppBarSize, double> _iconSize = {
    AppBarSize.mini: 18,
    AppBarSize.small: 20,
    AppBarSize.medium: 24,
    AppBarSize.large: 28,
    AppBarSize.extraLarge: 32,
  };

  static double getHeight(AppBarSize size) => _heights[size]!;
  static double getFontSize(AppBarSize size) => _fontSize[size]!;
  static double getIconSize(AppBarSize size) => _iconSize[size]!;
}
