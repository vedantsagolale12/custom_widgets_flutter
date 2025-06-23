import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Decoration? decoration;
  final AlignmentGeometry? alignment;
  final BoxConstraints? constraints;
  final BoxDecoration? boxDecoration;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final Gradient? gradient;
  final BoxShape shape;
  final List<BoxShadow>? boxShadow;

  const CustomContainer({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.color,
    this.decoration,
    this.alignment,
    this.constraints,
    this.boxDecoration,
    this.child,
    this.borderRadius,
    this.border,
    this.gradient,
    this.shape = BoxShape.rectangle,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      alignment: alignment,
      constraints: constraints,
      decoration:
          boxDecoration ??
          BoxDecoration(
            color: color,
            borderRadius: shape == BoxShape.rectangle ? borderRadius : null,
            border: border,
            gradient: gradient,
            shape: shape,
            boxShadow: boxShadow,
          ),
      child: child,
    );
  }
}
