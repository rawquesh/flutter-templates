class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'FitLife Pro';
  static const String appVersion = '1.0.0';

  // Animation Durations
  static const Duration animationFast = Duration(milliseconds: 150);
  static const Duration animationNormal = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);
  static const Duration animationVerySlow = Duration(milliseconds: 800);

  // Border Radius
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;
  static const double radiusXLarge = 20.0;
  static const double radiusXXLarge = 24.0;

  // Blur Values
  static const double blurLight = 10.0;
  static const double blurMedium = 15.0;
  static const double blurHeavy = 25.0;

  // Spacing
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;

  // Icon Sizes
  static const double iconSmall = 16.0;
  static const double iconMedium = 24.0;
  static const double iconLarge = 32.0;
  static const double iconXLarge = 48.0;

  // Card Dimensions
  static const double cardElevation = 0.0;
  static const double glassOpacity = 0.1;
  static const double glassBorderOpacity = 0.2;

  // Progress Ring
  static const double progressRingSmall = 50.0;
  static const double progressRingMedium = 80.0;
  static const double progressRingLarge = 120.0;
  static const double progressStrokeWidth = 8.0;

  // Bottom Navigation
  static const double bottomNavHeight = 70.0;

  // Timer Defaults
  static const int defaultRestTimeSeconds = 60;
  static const int defaultWorkoutTimeMinutes = 30;

  // Water Tracker
  static const int glassSmallMl = 250;
  static const int glassMediumMl = 350;
  static const int glassLargeMl = 500;
  static const int dailyWaterGoalMl = 2000;

  // Workout Defaults
  static const int defaultSets = 3;
  static const int defaultReps = 10;
  static const int defaultRestBetweenSets = 60;

  // Gamification
  static const int xpPerWorkout = 100;
  static const int xpPerStreak = 50;
  static const int levelUpXp = 500;
}
