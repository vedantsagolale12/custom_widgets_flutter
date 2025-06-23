import 'package:flutter/material.dart';

/// Common shadows used throughout the app
abstract class AppShadows {
  static const BoxShadow light = BoxShadow(
    color: Colors.black12,
    offset: Offset(0, 2),
    blurRadius: 4,
  );

  static const BoxShadow medium = BoxShadow(
    color: Colors.black26,
    offset: Offset(0, 4),
    blurRadius: 8,
  );

  static const BoxShadow heavy = BoxShadow(
    color: Colors.black38,
    offset: Offset(0, 6),
    blurRadius: 12,
  );

  static const List<BoxShadow> cardShadow = [light];
  static const List<BoxShadow> buttonShadow = [medium];
}
