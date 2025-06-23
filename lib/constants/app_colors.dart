import 'package:flutter/material.dart';

/// Abstract contract for app color palettes
abstract class AppColors {
  Color get primary;
  Color get secondary;
  Color get background;
  Color get tertiary;
  Color get scaffoldBackground;
  Color get textPrimary;
  Color get textSecondary;
  Color get accent;
  Color get error;
  Color get success;
  Color get border;
  Color get disabled;
  Color get surface;
}

/// Concrete light mode colors
class LightAppColors implements AppColors {
  @override
  Color get primary => const Color(0xFF0066FF);
  @override
  Color get secondary => const Color(0xFF00BFA6);
  @override
  Color get background => const Color(0xFFF5F5F5);
  @override
  Color get tertiary => const Color.fromARGB(255, 41, 95, 243);
  @override
  Color get scaffoldBackground => const Color(0xFFFFFFFF);
  @override
  Color get textPrimary => const Color(0xFF1C1C1C);
  @override
  Color get textSecondary => const Color(0xFF757575);
  @override
  Color get accent => const Color(0xFFFFC107);
  @override
  Color get error => const Color(0xFFD32F2F);
  @override
  Color get success => const Color(0xFF388E3C);
  @override
  Color get border => const Color(0xFFE0E0E0);
  @override
  Color get disabled => const Color(0xFFBDBDBD);
  @override
  Color get surface => const Color(0xFFF2F2F2);
}

/// Concrete dark mode colors
class DarkAppColors implements AppColors {
  @override
  Color get primary => const Color(0xFF0066FF);
  @override
  Color get secondary => const Color(0xFF00BFA6);
  @override
  Color get background => const Color(0xFF1C1C1C);
  @override
  Color get scaffoldBackground => const Color(0xFF1C1C1C);
  @override
  Color get textPrimary => const Color(0xFFFFFFFF);
  @override
  Color get textSecondary => const Color(0xFFB0BEC5);
  @override
  Color get accent => const Color(0xFFFFC107);
  @override
  Color get error => const Color(0xFFEF5350);
  @override
  Color get success => const Color(0xFF81C784);
  @override
  Color get border => const Color(0xFF37474F);
  @override
  Color get disabled => const Color(0xFF757575);
  @override
  Color get surface => const Color(0xFF2C2C2C);
  @override
  Color get tertiary => const Color.fromARGB(255, 100, 149, 237);
}

/// Extension to use AppColors via BuildContext
extension AppColorExtension on BuildContext {
  /// Access current theme's AppColors
  AppColors get appColors => Theme.of(this).brightness == Brightness.dark
      ? DarkAppColors()
      : LightAppColors();
}


/**
 * 
 *  @params usage :
 * Text(
          'Primary Text',
            style: TextStyle(
              color: context.appColors.textPrimary,
              fontSize: 18,
            ),
          ),

    for dark mode and light mode it will adjust automatically according to theme mode.
    MaterialApp(
  themeMode: ThemeMode.system, // or ThemeMode.dark/light
  theme: ThemeData.light(),
  darkTheme: ThemeData.dark(),
  home: const SampleWidget(),
)
 */