/// Reusable constants across the app
abstract class AppConstants {
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 400);
  static const Duration longAnimation = Duration(milliseconds: 600);

  // API
  static const int defaultTimeout = 15000; // in milliseconds

  // Limits
  static const int maxNameLength = 50;
  static const int maxDescriptionLength = 500;

  // Padding
  static const double defaultPadding = 16.0;
}
