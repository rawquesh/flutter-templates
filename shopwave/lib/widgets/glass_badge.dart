import 'package:flutter/material.dart';
import '../theme/colors.dart';

class GlassBadge extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  final BorderRadius? borderRadius;

  const GlassBadge({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.fontSize = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.accentCoral,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class GlassSaleBadge extends StatelessWidget {
  final int discount;
  final double fontSize;

  const GlassSaleBadge({
    super.key,
    required this.discount,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: AppColors.gradientAccent,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.accentCoral.withValues(alpha: 0.4),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        '-$discount%',
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class GlassCountBadge extends StatelessWidget {
  final int count;
  final Color? backgroundColor;

  const GlassCountBadge({
    super.key,
    required this.count,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    if (count <= 0) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.accentCoral,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: (backgroundColor ?? AppColors.accentCoral).withValues(alpha: 0.4),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      constraints: const BoxConstraints(
        minWidth: 20,
        minHeight: 20,
      ),
      child: Text(
        count > 99 ? '99+' : '$count',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class GlassStatusBadge extends StatelessWidget {
  final String status;

  const GlassStatusBadge({
    super.key,
    required this.status,
  });

  Color get _backgroundColor {
    switch (status.toLowerCase()) {
      case 'delivered':
        return AppColors.success;
      case 'shipped':
        return AppColors.primaryBlue;
      case 'processing':
        return AppColors.warning;
      case 'cancelled':
        return AppColors.error;
      default:
        return AppColors.textSecondaryLight;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _backgroundColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: _backgroundColor.withValues(alpha: 0.3),
        ),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: _backgroundColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
