import 'package:flutter/material.dart';

/// Standardized spacing system (like margin, padding)
abstract class AppSpacings {
  // Padding Sizes
  static const double xxs = 2.0;
  static const double xs = 4.0;
  static const double s = 8.0;
  static const double m = 16.0;
  static const double l = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;

  // Horizontal & Vertical Insets
  static const EdgeInsets horizontalS = EdgeInsets.symmetric(horizontal: s);
  static const EdgeInsets horizontalM = EdgeInsets.symmetric(horizontal: m);
  static const EdgeInsets horizontalL = EdgeInsets.symmetric(horizontal: l);

  static const EdgeInsets verticalS = EdgeInsets.symmetric(vertical: s);
  static const EdgeInsets verticalM = EdgeInsets.symmetric(vertical: m);
  static const EdgeInsets verticalL = EdgeInsets.symmetric(vertical: l);

  // All Sides
  static const EdgeInsets allXS = EdgeInsets.all(xs);
  static const EdgeInsets allS = EdgeInsets.all(s);
  static const EdgeInsets allM = EdgeInsets.all(m);
  static const EdgeInsets allL = EdgeInsets.all(l);
  static const EdgeInsets allXL = EdgeInsets.all(xl);

  // Gaps (Widgets)
  static const SizedBox gapXS = SizedBox(height: xs);
  static const SizedBox gapS = SizedBox(height: s);
  static const SizedBox gapM = SizedBox(height: m);
  static const SizedBox gapL = SizedBox(height: l);
  static const SizedBox gapXL = SizedBox(height: xl);
}
