import 'package:flutter/material.dart';

class AppBarActionItem {
  final IconData? icon;
  final String? iconPath;
  final String? text;
  final VoidCallback? onPressed;
  final String? tooltip;
  final Color? iconColor;
  final Color? textColor;
  final bool showBadge;
  final String? badgeText;
  final Color? badgeColor;
  final bool isLoading;

  const AppBarActionItem({
    this.icon,
    this.text,
    this.iconPath,
    this.onPressed,
    this.tooltip,
    this.iconColor,
    this.textColor,
    this.showBadge = false,
    this.badgeText,
    this.badgeColor,
    this.isLoading = false,
  });
}
