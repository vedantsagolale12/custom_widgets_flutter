import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double thickness;
  final Color? color;
  final double indent;
  final double endIndent;
  final double? height;

  const CustomDivider({
    super.key,
    this.thickness = 1.0,
    this.color,
    this.indent = 0.0,
    this.endIndent = 0.0,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      color: color ?? Theme.of(context).dividerColor,
      indent: indent,
      endIndent: endIndent,
      height: height,
    );
  }
}