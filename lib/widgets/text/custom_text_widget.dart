import 'package:custom_widgets_flutter/constants/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:custom_widgets_flutter/enums/app_ui_enums.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextType textType;
  final FontWeightType fontWeight;
  final TextAlignType? textAlign;
  final AppTextDecoration? decoration;
  final TextTransform textTransform;
  final Color? color;
  final double? fontSizeOverride;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextOverflow? overflow;
  final int? maxLines;
  final List<Shadow>? shadows;
  final String? fontFamily;
  final AppThemeMode? themeMode;
  final ElevationLevel? elevation;
  final bool softWrap;
  final TextDirection? textDirection;
  final TextWidthBasis? textWidthBasis;
  final Locale? locale;

  const CustomText({
    super.key,
    required this.text,
    this.textType = TextType.body1,
    this.fontWeight = FontWeightType.regular,
    this.textAlign,
    this.decoration = AppTextDecoration.none,
    this.textTransform = TextTransform.none,
    this.color,
    this.fontSizeOverride,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.overflow,
    this.maxLines,
    this.shadows,
    this.fontFamily,
    this.themeMode,
    this.elevation,
    this.softWrap = true,
    this.textDirection,
    this.textWidthBasis,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    final transformedText = AppTypography.applyTextTransform(
      text,
      textTransform,
    );

    TextStyle baseStyle = AppTypography.getTextStyle(
      context,
      type: textType,
      fontWeight: fontWeight,
      color: color,
      decoration: decoration,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      height: height,
      shadows: shadows,
      fontFamily: fontFamily,
    );

    if (elevation != null) {
      baseStyle = AppTypography.withElevation(baseStyle, elevation: elevation!);
    }

    if (fontSizeOverride != null) {
      baseStyle = baseStyle.copyWith(fontSize: fontSizeOverride);
    }

    return Text(
      transformedText,
      textAlign: textAlign != null
          ? AppTypography.getTextAlign(textAlign!)
          : null,
      style: baseStyle,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      textDirection: textDirection,
      textWidthBasis: textWidthBasis,
      locale: locale,
    );
  }
}
