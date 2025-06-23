import 'package:custom_widgets_flutter/enums/app_ui_enums.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final IconSize? iconSize;
  final double? size;
  final Color? color;
  final ColorVariant? colorVariant;
  final VoidCallback? onTap;
  final SemanticRole? semanticRole;

  const CustomIcon({
    super.key,
    required this.icon,
    this.iconSize,
    this.size,
    this.color,
    this.colorVariant,
    this.onTap,
    this.semanticRole,
  });

  double _resolveIconSize(IconSize? size) {
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
      default:
        return 24;
    }
  }

  Color? _resolveColor(BuildContext context, ColorVariant? variant) {
    switch (variant) {
      case ColorVariant.primary:
        return Theme.of(context).colorScheme.primary;
      case ColorVariant.secondary:
        return Theme.of(context).colorScheme.secondary;
      case ColorVariant.accent:
        return Colors.tealAccent;
      case ColorVariant.neutral:
        return Colors.grey;
      case ColorVariant.success:
        return Colors.green;
      case ColorVariant.warning:
        return Colors.orange;
      case ColorVariant.error:
        return Colors.red;
      case ColorVariant.info:
        return Colors.blue;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final resolvedSize = size ?? _resolveIconSize(iconSize);
    final resolvedColor = color ?? _resolveColor(context, colorVariant);

    Widget iconWidget = Icon(
      icon,
      size: resolvedSize,
      color: resolvedColor,
      semanticLabel: semanticRole?.name,
    );

    return onTap != null
        ? GestureDetector(onTap: onTap, child: iconWidget)
        : iconWidget;
  }
}
