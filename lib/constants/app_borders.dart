import 'package:flutter/material.dart';
import 'app_dimensions.dart';

/// Reusable border radius and border styles
abstract class AppBorders {
  // Border Radius
  static const BorderRadius radiusXS = BorderRadius.all(Radius.circular(AppDimensions.radiusXS));
  static const BorderRadius radiusS = BorderRadius.all(Radius.circular(AppDimensions.radiusS));
  static const BorderRadius radiusM = BorderRadius.all(Radius.circular(AppDimensions.radiusM));
  static const BorderRadius radiusL = BorderRadius.all(Radius.circular(AppDimensions.radiusL));
  static const BorderRadius radiusXL = BorderRadius.all(Radius.circular(AppDimensions.radiusXL));

  // Full Rounded for Circular Buttons/Avatars
  static const BorderRadius fullRounded = BorderRadius.all(Radius.circular(100));

  // Border Styles
  static Border defaultBorder(Color color, {double width = 1.0}) {
    return Border.all(color: color, width: width);
  }

  static OutlineInputBorder outlineInput(Color color, {double radius = AppDimensions.radiusS}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: color, width: 1.2),
    );
  }
}
