import 'package:custom_widgets_flutter/enums/app_ui_enums.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final IconSize size;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final double? borderRadius;
  final String? tooltip;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = IconSize.medium,
    this.color,
    this.backgroundColor,
    this.borderRadius = 8.0,
    this.tooltip,
  });

  double _getIconSize() {
    switch (size) {
      case IconSize.mini:
        return 12;
      case IconSize.small:
        return 16;
      case IconSize.medium:
        return 20;
      case IconSize.large:
        return 24;
      case IconSize.extraLarge:
        return 32;
    }
  }

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(icon, size: _getIconSize(), color: color);
    final button = Material(
      color: backgroundColor ?? Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius ?? 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        onTap: onPressed,
        child: Padding(padding: const EdgeInsets.all(8), child: iconWidget),
      ),
    );
    return tooltip != null ? Tooltip(message: tooltip!, child: button) : button;
  }
}
