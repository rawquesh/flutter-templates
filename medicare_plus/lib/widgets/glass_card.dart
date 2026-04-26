import 'dart:ui';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final double blur;
  final double opacity;
  final VoidCallback? onTap;
  final bool isDark;

  const GlassCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius = AppConstants.radiusMedium,
    this.blur = AppConstants.blurSigma,
    this.opacity = AppConstants.glassOpacityLight,
    this.onTap,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(borderRadius),
              child: Container(
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? Colors.white.withOpacity(opacity)
                      : Colors.white.withOpacity(opacity),
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(
                    color: isDarkMode
                        ? Colors.white.withOpacity(0.2)
                        : Colors.white.withOpacity(0.3),
                    width: AppConstants.borderWidth,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(isDarkMode ? 0.3 : 0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                padding: padding ?? const EdgeInsets.all(AppConstants.paddingMedium),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final double blur;
  final double opacity;
  final Color? color;
  final Border? border;

  const GlassContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius = AppConstants.radiusMedium,
    this.blur = AppConstants.blurSigma,
    this.opacity = AppConstants.glassOpacityLight,
    this.color,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            decoration: BoxDecoration(
              color: color ?? Colors.white.withOpacity(opacity),
              borderRadius: BorderRadius.circular(borderRadius),
              border: border ??
                  Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: AppConstants.borderWidth,
                  ),
            ),
            padding: padding ?? const EdgeInsets.all(AppConstants.paddingMedium),
            child: child,
          ),
        ),
      ),
    );
  }
}
