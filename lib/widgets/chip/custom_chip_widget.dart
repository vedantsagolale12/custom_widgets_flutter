import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool isDeletable;
  final VoidCallback? onDeleted;

  const CustomChip({
    super.key,
    required this.label,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.onPressed,
    this.isDeletable = false,
    this.onDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: icon != null ? Icon(icon, size: 18, color: textColor) : null,
      label: Text(label, style: TextStyle(color: textColor)),
      backgroundColor:
          backgroundColor ?? Theme.of(context).chipTheme.backgroundColor,
      onPressed: onPressed,
      // onDeleted: isDeletable ? onDeleted : null,
      // deleteIcon: isDeletable ? const Icon(Icons.close, size: 18) : null,
    );
  }
}
