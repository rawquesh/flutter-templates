import 'dart:ui';
import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double blur;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final VoidCallback? onTap;

  const GlassCard({
    super.key,
    required this.child,
    this.borderRadius = 16,
    this.padding,
    this.margin,
    this.blur = 15,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final defaultBgColor = isDark
        ? Colors.white.withValues(alpha: 0.1)
        : Colors.white.withValues(alpha: 0.7);
    final defaultBorderColor = isDark
        ? Colors.white.withValues(alpha: 0.2)
        : Colors.white.withValues(alpha: 0.5);

    return Container(
      margin: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor ?? defaultBgColor,
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  color: borderColor ?? defaultBorderColor,
                  width: borderWidth,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              padding: padding ?? const EdgeInsets.all(16),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
