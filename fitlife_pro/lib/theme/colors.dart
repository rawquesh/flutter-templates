import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primaryOrange = Color(0xFFFF6B35);
  static const Color primaryRedOrange = Color(0xFFFF4500);

  // Secondary/Accent
  static const Color accentBlue = Color(0xFF00D4FF);

  // Status Colors
  static const Color success = Color(0xFF32CD32);
  static const Color warning = Color(0xFFFFD700);
  static const Color error = Color(0xFFFF4444);

  // Light Theme Colors
  static const Color backgroundLight = Color(0xFFF5F5F7);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color sidebarLight = Color(0xFFFFFFFF);
  static const Color textPrimaryLight = Color(0xFF1A1A2E);
  static const Color textSecondaryLight = Color(0xFF666666);

  // Dark Theme Colors
  static const Color backgroundDark = Color(0xFF0D0D1A);
  static const Color cardDark = Color(0xFF1A1A2E);
  static const Color sidebarDark = Color(0xFF141420);
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFF888888);

  // Dark Sidebar Theme (Hybrid)
  static const Color darkSidebar = Color(0xFF141420);
  static const Color lightContent = Color(0xFFFAFAFA);

  // Glass Effect Colors
  static const Color glassWhite = Color(0x1AFFFFFF);
  static const Color glassBorder = Color(0x33FFFFFF);
  static const Color glassDark = Color(0x1A000000);
  static const Color glassDarkBorder = Color(0x33000000);

  // Gradient Colors
  static const Color gradientOrangeStart = Color(0xFFFF6B35);
  static const Color gradientOrangeEnd = Color(0xFFFF4500);
  static const Color gradientPurpleStart = Color(0xFF1A1A2E);
  static const Color gradientPurpleEnd = Color(0xFF6B35FF);
  static const Color gradientBlueStart = Color(0xFF0D0D1A);
  static const Color gradientBlueEnd = Color(0xFF4500FF);

  // Progress Colors
  static const Color progressCalories = Color(0xFFFF6B35);
  static const Color progressSteps = Color(0xFF00D4FF);
  static const Color progressHeart = Color(0xFFFF4444);
  static const Color progressWater = Color(0xFF4FC3F7);
  static const Color progressProtein = Color(0xFFFF7043);
  static const Color progressCarbs = Color(0xFFFFCA28);
  static const Color progressFats = Color(0xFF7E57C2);

  // Chart Colors
  static const List<Color> chartColors = [
    primaryOrange,
    accentBlue,
    success,
    warning,
    Color(0xFF9C27B0),
    Color(0xFF00BCD4),
  ];

  // Gradient Definitions
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [gradientOrangeStart, gradientOrangeEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient backgroundGradientLight = LinearGradient(
    colors: [Color(0xFFF5F5F7), Color(0xFFE8E8EC)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient backgroundGradientDark = LinearGradient(
    colors: [Color(0xFF0D0D1A), Color(0xFF1A1A2E)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient energeticGradient = LinearGradient(
    colors: [Color(0xFF1A1A2E), Color(0xFFFF6B35)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient loginBackgroundGradient = LinearGradient(
    colors: [Color(0xFF1A1A2E), Color(0xFF2D1B4E), Color(0xFFFF6B35)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
