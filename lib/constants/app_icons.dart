import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


/// Holds all the icon asset paths in a centralized and scalable way.
abstract class AppIcons {
  static const String _basePath = 'assets/icons';

  static const String appLogo = '$_basePath/app_logo.svg';
  static const String home = '$_basePath/home.svg';
  static const String settings = '$_basePath/settings.svg';
  static const String profile = '$_basePath/profile.svg';
  static const String notifications = '$_basePath/notifications.svg';
  static const String error = '$_basePath/error.svg';
  static const String success = '$_basePath/success.svg';
  static const String logout = '$_basePath/logout.svg';
  static const String theme = '$_basePath/theme.svg';
  static const String info = '$_basePath/info.svg';

  // Social Icons
  static const String google = '$_basePath/google.svg';
  static const String facebook = '$_basePath/facebook.svg';
  static const String twitter = '$_basePath/twitter.svg';
}

/// Holds all the image asset paths in a centralized and scalable way.
abstract class AppImages {
  static const String _basePath = 'assets/images';

  static const String splashBackground = '$_basePath/splash_bg.png';
  static const String loginIllustration = '$_basePath/login_illustration.png';
  static const String onboarding1 = '$_basePath/onboarding1.png';
  static const String onboarding2 = '$_basePath/onboarding2.png';
  static const String emptyState = '$_basePath/empty_state.png';
  static const String errorState = '$_basePath/error_state.png';
  static const String noInternet = '$_basePath/no_internet.png';
  static const String userPlaceholder = '$_basePath/user_placeholder.png';
  static const String banner = '$_basePath/banner.png';
}

// extensions : 
// rename according to app requirements !!
extension SvgIconExtension on String {
  /// Loads an SVG icon from assets with optional size and color.
  Widget toSvgIcon({
    double size = 24,
    Color? color,
    BoxFit fit = BoxFit.contain,
  }) {
    return SvgPicture.asset(
      this,
      width: size,
      height: size,
      colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      fit: fit,
    );
  }
}

extension PngImageExtension on String {
  /// Loads a PNG image from assets with optional size, fit and errorBuilder.
  Widget toImage({
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    Widget? errorWidget,
  }) {
    return Image.asset(
      this,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return errorWidget ?? const Icon(Icons.error);
      },
    );
  }
}
