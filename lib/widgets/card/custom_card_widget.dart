import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final double? elevation;
  final ShapeBorder? shape;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Clip clipBehavior;
  final VoidCallback? onTap;
  final bool isClickable;
  final BoxConstraints? constraints;
  final AlignmentGeometry? alignment;
  final BorderRadiusGeometry? borderRadiusGeometry;
  final Gradient? gradient;
  final BoxBorder? border;
  final BoxShadow? boxShadow;
  final BorderRadius? borderRadius;

  const CustomCard({
    super.key,
    this.child,
    this.color,
    this.elevation,
    this.shape,
    this.margin,
    this.padding,
    this.clipBehavior = Clip.none,
    this.onTap,
    this.isClickable = false,
    this.constraints,
    this.alignment,
    this.borderRadiusGeometry,
    this.borderRadius,
    this.gradient,
    this.border,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    final content = Container(
      padding: padding,
      alignment: alignment,
      constraints: constraints,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).cardColor,
        borderRadius: borderRadius,
        gradient: gradient,
        border: border,
        boxShadow: boxShadow != null ? [boxShadow!] : null,
      ),
      child: child,
    );

    return Material(
      color: Colors.transparent,
      elevation: elevation ?? 1,
      shape:
          shape ??
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
          ),
      clipBehavior: clipBehavior,
      child: InkWell(
        onTap: isClickable ? onTap : null,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        child: content,
      ),
    );
  }
}
