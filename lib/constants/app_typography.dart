import 'package:custom_widgets_flutter/enums/app_ui_enums.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Import your UI enums (assuming they're in a separate file)
// import 'ui_enums.dart';

/// Comprehensive Typography System using Google Fonts
/// Provides consistent text styling across the entire application
class AppTypography {
  // ===== FONT FAMILIES =====

  /// Primary font family for headings and display text
  static String get primaryFontFamily => 'Inter';

  /// Secondary font family for body text
  static String get secondaryFontFamily => 'Roboto';

  /// Monospace font family for code and technical text
  static String get monospaceFontFamily => 'JetBrains Mono';

  /// Decorative font family for special occasions
  static String get decorativeFontFamily => 'Playfair Display';

  // ===== FONT WEIGHT MAPPING =====

  /// Maps FontWeightType enum to Flutter FontWeight
  static FontWeight getFontWeight(FontWeightType type) {
    switch (type) {
      case FontWeightType.thin:
        return FontWeight.w100;
      case FontWeightType.extraLight:
        return FontWeight.w200;
      case FontWeightType.light:
        return FontWeight.w300;
      case FontWeightType.regular:
        return FontWeight.w400;
      case FontWeightType.medium:
        return FontWeight.w500;
      case FontWeightType.semiBold:
        return FontWeight.w600;
      case FontWeightType.bold:
        return FontWeight.w700;
      case FontWeightType.extraBold:
        return FontWeight.w800;
      case FontWeightType.black:
        return FontWeight.w900;
    }
  }

  // ===== TEXT ALIGNMENT MAPPING =====

  /// Maps TextAlignType enum to Flutter TextAlign
  static TextAlign getTextAlign(TextAlignType type) {
    switch (type) {
      case TextAlignType.left:
        return TextAlign.left;
      case TextAlignType.center:
        return TextAlign.center;
      case TextAlignType.right:
        return TextAlign.right;
      case TextAlignType.justify:
        return TextAlign.justify;
      case TextAlignType.start:
        return TextAlign.start;
      case TextAlignType.end:
        return TextAlign.end;
    }
  }

  // ===== TEXT DECORATION MAPPING =====

  /// Maps TextDecoration enum to Flutter TextDecoration
  static TextDecoration? getTextDecoration(AppTextDecoration? type) {
    switch (type) {
      case AppTextDecoration.none:
        return TextDecoration.none;
      case AppTextDecoration.underline:
        return TextDecoration.underline;
      case AppTextDecoration.overline:
        return TextDecoration.overline;
      case AppTextDecoration.lineThrough:
        return TextDecoration.lineThrough;
      default:
        return null;
    }
  }

  // ===== RESPONSIVE FONT SIZES =====

  /// Get responsive font size based on screen size
  static double getResponsiveFontSize(
    BuildContext context,
    double baseFontSize,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      // Mobile: Reduce font size by 10%
      return baseFontSize * 0.9;
    } else if (screenWidth < 1200) {
      // Tablet: Keep base size
      return baseFontSize;
    } else {
      // Desktop: Increase font size by 10%
      return baseFontSize * 1.1;
    }
  }

  // ===== TYPOGRAPHY STYLES BY TYPE =====

  /// Get TextStyle for specific TextType
  static TextStyle getTextStyle(
    BuildContext context, {
    required TextType type,
    FontWeightType fontWeight = FontWeightType.regular,
    Color? color,
    AppTextDecoration? decoration = AppTextDecoration.none,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
    List<Shadow>? shadows,
    String? fontFamily,
  }) {
    final baseFontSizes = _getBaseFontSizes();
    final baseFontSize = baseFontSizes[type] ?? 16.0;
    final responsiveFontSize = getResponsiveFontSize(context, baseFontSize);
    final selectedFontFamily = fontFamily ?? _getFontFamilyForType(type);
    TextStyle baseStyle = _getGoogleFontStyle(selectedFontFamily);

    return baseStyle.copyWith(
      fontSize: responsiveFontSize,
      fontWeight: getFontWeight(fontWeight),
      color: color,
      decoration: getTextDecoration(decoration),
      letterSpacing: letterSpacing ?? _getLetterSpacingForType(type),
      wordSpacing: wordSpacing,
      height: height ?? _getLineHeightForType(type),
      shadows: shadows,
    );
  }

  // ===== PREDEFINED TEXT STYLES =====

  /// Display text - Largest headlines (96sp)
  static TextStyle display(
    BuildContext context, {
    FontWeightType fontWeight = FontWeightType.light,
    Color? color,
  }) => getTextStyle(
    context,
    type: TextType.display,
    fontWeight: fontWeight,
    color: color,
  );

  /// Heading 1 - Main page titles (60sp)
  static TextStyle heading1(
    BuildContext context, {
    FontWeightType fontWeight = FontWeightType.medium,
    Color? color,
  }) => getTextStyle(
    context,
    type: TextType.heading1,
    fontWeight: fontWeight,
    color: color,
  );

  /// Heading 2 - Section titles (48sp)
  static TextStyle heading2(
    BuildContext context, {
    FontWeightType fontWeight = FontWeightType.medium,
    Color? color,
  }) => getTextStyle(
    context,
    type: TextType.heading2,
    fontWeight: fontWeight,
    color: color,
  );

  /// Heading 3 - Subsection titles (34sp)
  static TextStyle heading3(
    BuildContext context, {
    FontWeightType fontWeight = FontWeightType.regular,
    Color? color,
  }) => getTextStyle(
    context,
    type: TextType.heading3,
    fontWeight: fontWeight,
    color: color,
  );

  /// Heading 4 - Card titles (24sp)
  static TextStyle heading4(
    BuildContext context, {
    FontWeightType fontWeight = FontWeightType.regular,
    Color? color,
  }) => getTextStyle(
    context,
    type: TextType.heading4,
    fontWeight: fontWeight,
    color: color,
  );

  /// Subtitle 1 - Main subtitles (20sp)
  static TextStyle subtitle1(
    BuildContext context, {
    FontWeightType fontWeight = FontWeightType.medium,
    Color? color,
  }) => getTextStyle(
    context,
    type: TextType.subtitle1,
    fontWeight: fontWeight,
    color: color,
  );

  /// Subtitle 2 - Secondary subtitles (16sp)
  static TextStyle subtitle2(
    BuildContext context, {
    FontWeightType fontWeight = FontWeightType.medium,
    Color? color,
  }) => getTextStyle(
    context,
    type: TextType.subtitle2,
    fontWeight: fontWeight,
    color: color,
  );

  /// Body 1 - Main body text (16sp)
  static TextStyle body1(
    BuildContext context, {
    FontWeightType fontWeight = FontWeightType.regular,
    Color? color,
  }) => getTextStyle(
    context,
    type: TextType.body1,
    fontWeight: fontWeight,
    color: color,
  );

  /// Body 2 - Secondary body text (14sp)
  static TextStyle body2(
    BuildContext context, {
    FontWeightType fontWeight = FontWeightType.regular,
    Color? color,
  }) => getTextStyle(
    context,
    type: TextType.body2,
    fontWeight: fontWeight,
    color: color,
  );

  /// Caption - Small descriptive text (12sp)
  static TextStyle caption(
    BuildContext context, {
    FontWeightType fontWeight = FontWeightType.regular,
    Color? color,
  }) => getTextStyle(
    context,
    type: TextType.caption,
    fontWeight: fontWeight,
    color: color,
  );

  /// Overline - Small labels and categories (10sp)
  static TextStyle overline(
    BuildContext context, {
    FontWeightType fontWeight = FontWeightType.regular,
    Color? color,
  }) => getTextStyle(
    context,
    type: TextType.overline,
    fontWeight: fontWeight,
    color: color,
    letterSpacing: 1.5,
  );

  /// Button text - Button labels (14sp)
  static TextStyle button(
    BuildContext context, {
    FontWeightType fontWeight = FontWeightType.medium,
    Color? color,
  }) => getTextStyle(
    context,
    type: TextType.button,
    fontWeight: fontWeight,
    color: color,
    letterSpacing: 1.25,
  );

  /// Label - Form field labels (12sp)
  static TextStyle label(
    BuildContext context, {
    FontWeightType fontWeight = FontWeightType.medium,
    Color? color,
  }) => getTextStyle(
    context,
    type: TextType.label,
    fontWeight: fontWeight,
    color: color,
  );

  /// Tooltip - Tooltip text (10sp)
  static TextStyle tooltip(
    BuildContext context, {
    FontWeightType fontWeight = FontWeightType.regular,
    Color? color,
  }) => getTextStyle(
    context,
    type: TextType.tooltip,
    fontWeight: fontWeight,
    color: color,
  );

  /// Code - Monospace code text (14sp)
  static TextStyle code(
    BuildContext context, {
    FontWeightType fontWeight = FontWeightType.regular,
    Color? color,
  }) => getTextStyle(
    context,
    type: TextType.code,
    fontWeight: fontWeight,
    color: color,
    fontFamily: monospaceFontFamily,
  );

  /// Link - Hyperlink text (16sp)
  static TextStyle link(
    BuildContext context, {
    FontWeightType fontWeight = FontWeightType.regular,
    Color? color,
  }) => getTextStyle(
    context,
    type: TextType.link,
    fontWeight: fontWeight,
    color: color ?? Colors.blue,
    decoration: AppTextDecoration.underline,
  );

  // ===== THEME-BASED TEXT STYLES =====

  /// Get text styles for different app themes
  static TextStyle getThemedTextStyle(
    BuildContext context, {
    required TextType type,
    required AppThemeMode themeMode,
    FontWeightType fontWeight = FontWeightType.regular,
  }) {
    Color textColor;

    switch (themeMode) {
      case AppThemeMode.light:
        textColor = Colors.black87;
        break;
      case AppThemeMode.dark:
        textColor = Colors.white;
        break;
      case AppThemeMode.highContrast:
        textColor = Colors.black;
        break;
      case AppThemeMode.sepia:
        textColor = const Color(0xFF3E2723);
        break;
      case AppThemeMode.system:
        textColor = Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black87;
        break;
    }

    return getTextStyle(
      context,
      type: type,
      fontWeight: fontWeight,
      color: textColor,
    );
  }

  // ===== UTILITY METHODS =====

  /// Apply text transform to string
  static String applyTextTransform(String text, TextTransform transform) {
    switch (transform) {
      case TextTransform.none:
        return text;
      case TextTransform.uppercase:
        return text.toUpperCase();
      case TextTransform.lowercase:
        return text.toLowerCase();
      case TextTransform.capitalize:
        return text
            .split(' ')
            .map(
              (word) => word.isEmpty
                  ? word
                  : '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}',
            )
            .join(' ');
    }
  }

  /// Create text style with custom spacing
  static TextStyle withSpacing(
    TextStyle baseStyle, {
    Spacing? letterSpacing,
    Spacing? wordSpacing,
  }) {
    return baseStyle.copyWith(
      letterSpacing: letterSpacing != null
          ? _getSpacingValue(letterSpacing)
          : null,
      wordSpacing: wordSpacing != null ? _getSpacingValue(wordSpacing) : null,
    );
  }

  /// Create elevated text style with shadow
  static TextStyle withElevation(
    TextStyle baseStyle, {
    required ElevationLevel elevation,
    Color shadowColor = Colors.black26,
  }) {
    final shadows = _getShadowsForElevation(elevation, shadowColor);
    return baseStyle.copyWith(shadows: shadows);
  }

  // ===== PRIVATE HELPER METHODS =====

  /// Get base font sizes for each text type
  static Map<TextType, double> _getBaseFontSizes() {
    return {
      TextType.display: 96.0,
      TextType.heading1: 60.0,
      TextType.heading2: 48.0,
      TextType.heading3: 34.0,
      TextType.heading4: 24.0,
      TextType.subtitle1: 20.0,
      TextType.subtitle2: 16.0,
      TextType.body1: 16.0,
      TextType.body2: 14.0,
      TextType.caption: 12.0,
      TextType.overline: 10.0,
      TextType.button: 14.0,
      TextType.label: 12.0,
      TextType.tooltip: 10.0,
      TextType.code: 14.0,
      TextType.link: 16.0,
    };
  }

  /// Get appropriate font family for text type
  static String _getFontFamilyForType(TextType type) {
    switch (type) {
      case TextType.display:
      case TextType.heading1:
      case TextType.heading2:
        return primaryFontFamily;
      case TextType.code:
        return monospaceFontFamily;
      default:
        return secondaryFontFamily;
    }
  }

  /// Get letter spacing for text type
  static double _getLetterSpacingForType(TextType type) {
    switch (type) {
      case TextType.display:
        return -1.5;
      case TextType.heading1:
        return -0.5;
      case TextType.overline:
        return 1.5;
      case TextType.button:
        return 1.25;
      case TextType.caption:
        return 0.4;
      default:
        return 0.0;
    }
  }

  /// Get line height for text type
  static double _getLineHeightForType(TextType type) {
    switch (type) {
      case TextType.display:
        return 1.0;
      case TextType.heading1:
      case TextType.heading2:
        return 1.2;
      case TextType.body1:
      case TextType.body2:
        return 1.5;
      case TextType.caption:
        return 1.33;
      default:
        return 1.4;
    }
  }

  /// Get Google Font style for font family
  static TextStyle _getGoogleFontStyle(String fontFamily) {
    switch (fontFamily) {
      case 'Inter':
        return GoogleFonts.inter();
      case 'Roboto':
        return GoogleFonts.roboto();
      case 'JetBrains Mono':
        return GoogleFonts.jetBrainsMono();
      case 'Playfair Display':
        return GoogleFonts.playfairDisplay();
      default:
        return GoogleFonts.roboto();
    }
  }

  /// Convert Spacing enum to pixel value
  static double _getSpacingValue(Spacing spacing) {
    switch (spacing) {
      case Spacing.none:
        return 0.0;
      case Spacing.xs:
        return 4.0;
      case Spacing.sm:
        return 8.0;
      case Spacing.md:
        return 16.0;
      case Spacing.lg:
        return 24.0;
      case Spacing.xl:
        return 32.0;
      case Spacing.xxl:
        return 48.0;
      case Spacing.xxxl:
        return 64.0;
    }
  }

  /// Get shadows for elevation level
  static List<Shadow> _getShadowsForElevation(
    ElevationLevel elevation,
    Color color,
  ) {
    switch (elevation) {
      case ElevationLevel.none:
        return [];
      case ElevationLevel.subtle:
        return [
          Shadow(color: color, offset: const Offset(0, 1), blurRadius: 2),
        ];
      case ElevationLevel.low:
        return [
          Shadow(color: color, offset: const Offset(0, 2), blurRadius: 4),
        ];
      case ElevationLevel.medium:
        return [
          Shadow(color: color, offset: const Offset(0, 4), blurRadius: 8),
        ];
      case ElevationLevel.high:
        return [
          Shadow(color: color, offset: const Offset(0, 8), blurRadius: 16),
        ];
      case ElevationLevel.extraHigh:
        return [
          Shadow(color: color, offset: const Offset(0, 12), blurRadius: 24),
        ];
      case ElevationLevel.floating:
        return [
          Shadow(color: color, offset: const Offset(0, 16), blurRadius: 32),
        ];
    }
  }

  // ===== TYPOGRAPHY THEME GENERATION =====

  /// Generate TextTheme for Material Design
  static TextTheme generateTextTheme(
    BuildContext context, {
    AppThemeMode? themeMode,
  }) {
    final mode = themeMode ?? AppThemeMode.system;

    return TextTheme(
      displayLarge: getThemedTextStyle(
        context,
        type: TextType.display,
        themeMode: mode,
      ),
      displayMedium: getThemedTextStyle(
        context,
        type: TextType.heading1,
        themeMode: mode,
      ),
      displaySmall: getThemedTextStyle(
        context,
        type: TextType.heading2,
        themeMode: mode,
      ),
      headlineLarge: getThemedTextStyle(
        context,
        type: TextType.heading3,
        themeMode: mode,
      ),
      headlineMedium: getThemedTextStyle(
        context,
        type: TextType.heading4,
        themeMode: mode,
      ),
      headlineSmall: getThemedTextStyle(
        context,
        type: TextType.subtitle1,
        themeMode: mode,
      ),
      titleLarge: getThemedTextStyle(
        context,
        type: TextType.subtitle2,
        themeMode: mode,
      ),
      titleMedium: getThemedTextStyle(
        context,
        type: TextType.body1,
        themeMode: mode,
      ),
      titleSmall: getThemedTextStyle(
        context,
        type: TextType.body2,
        themeMode: mode,
      ),
      bodyLarge: getThemedTextStyle(
        context,
        type: TextType.body1,
        themeMode: mode,
      ),
      bodyMedium: getThemedTextStyle(
        context,
        type: TextType.body2,
        themeMode: mode,
      ),
      bodySmall: getThemedTextStyle(
        context,
        type: TextType.caption,
        themeMode: mode,
      ),
      labelLarge: getThemedTextStyle(
        context,
        type: TextType.button,
        themeMode: mode,
      ),
      labelMedium: getThemedTextStyle(
        context,
        type: TextType.label,
        themeMode: mode,
      ),
      labelSmall: getThemedTextStyle(
        context,
        type: TextType.overline,
        themeMode: mode,
      ),
    );
  }

  // ===== ACCESSIBILITY HELPERS =====

  /// Get minimum font size for accessibility
  static double getAccessibleFontSize(
    double baseFontSize, {
    double scaleFactor = 1.0,
  }) {
    const minFontSize = 12.0;
    final scaledSize = baseFontSize * scaleFactor;
    return scaledSize < minFontSize ? minFontSize : scaledSize;
  }

  /// Get high contrast color for accessibility
  static Color getHighContrastColor(
    BuildContext context, {
    bool isDark = false,
  }) {
    return isDark ? Colors.white : Colors.black;
  }
}
