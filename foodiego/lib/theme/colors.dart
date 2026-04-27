import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primaryOrange = Color(0xFFFF7B00);
  static const Color primaryTangerine = Color(0xFFFF9500);
  static const Color accentRed = Color(0xFFE63946);
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color warningYellow = Color(0xFFFFC107);

  // Light Theme Colors
  static const Color backgroundLight = Color(0xFFFFF8F0);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color sidebarLight = Color(0xFFFFFFFF);
  static const Color textPrimaryLight = Color(0xFF3D2314);
  static const Color textSecondaryLight = Color(0xFF8B7355);

  // Dark Theme Colors
  static const Color backgroundDark = Color(0xFF1A1A1A);
  static const Color cardDark = Color(0xFF252525);
  static const Color sidebarDark = Color(0xFF151515);
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFFB8A89A);

  // CTA Button Gradient
  static const Color ctaGradientStart = Color(0xFFFF7B00);
  static const Color ctaGradientEnd = Color(0xFFFF4500);

  // Glass Effect Colors
  static const Color glassWhite = Color(0x1AFFFFFF);
  static const Color glassBorder = Color(0x33FFFFFF);
  static const Color glassDarkBorder = Color(0x1A000000);

  // Status Colors
  static const Color deliveredGreen = Color(0xFF2E7D32);
  static const Color preparingOrange = Color(0xFFFF9800);
  static const Color confirmedBlue = Color(0xFF2196F3);

  // Veg/Non-veg Indicators
  static const Color vegGreen = Color(0xFF4CAF50);
  static const Color nonVegRed = Color(0xFFE53935);

  // Gradient Colors for backgrounds
  static const List<Color> loginGradient = [
    Color(0xFFFF7B00),
    Color(0xFFE63946),
    Color(0xFFFF6B35),
  ];

  static const List<Color> warmGradient = [
    Color(0xFFFFF8F0),
    Color(0xFFFFE8D6),
  ];

  static const List<Color> sunsetGradient = [
    Color(0xFFFF7B00),
    Color(0xFFFF4500),
    Color(0xFFE63946),
  ];
}
