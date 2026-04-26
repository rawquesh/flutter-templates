import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/constants.dart';

enum GlassButtonVariant { primary, secondary, outline, gradient }

class GlassButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final GlassButtonVariant variant;
  final IconData? icon;
  final double? width;
  final double height;
  final bool isLoading;
  final bool isExpanded;

  const GlassButton({
    super.key,
    required this.text,
    this.onPressed,
    this.variant = GlassButtonVariant.primary,
    this.icon,
    this.width,
    this.height = 52,
    this.isLoading = false,
    this.isExpanded = false,
  });

  @override
  State<GlassButton> createState() => _GlassButtonState();
}

class _GlassButtonState extends State<GlassButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.isLoading ? null : widget.onPressed,
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: AppConstants.animationFast,
        child: _buildButton(isDark),
      ),
    );
  }

  Widget _buildButton(bool isDark) {
    switch (widget.variant) {
      case GlassButtonVariant.primary:
        return _buildPrimaryButton(isDark);
      case GlassButtonVariant.secondary:
        return _buildSecondaryButton(isDark);
      case GlassButtonVariant.outline:
        return _buildOutlineButton(isDark);
      case GlassButtonVariant.gradient:
        return _buildGradientButton(isDark);
    }
  }

  Widget _buildPrimaryButton(bool isDark) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: widget.isExpanded ? double.infinity : widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primaryBlue, AppColors.teal],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryBlue.withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: _buildContent(Colors.white),
        ),
      ),
    );
  }

  Widget _buildSecondaryButton(bool isDark) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: widget.isExpanded ? double.infinity : widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: isDark
                ? Colors.white.withOpacity(0.15)
                : Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
            border: Border.all(
              color: isDark
                  ? Colors.white.withOpacity(0.2)
                  : AppColors.primaryBlue.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: _buildContent(isDark ? Colors.white : AppColors.primaryBlue),
        ),
      ),
    );
  }

  Widget _buildOutlineButton(bool isDark) {
    return Container(
      width: widget.isExpanded ? double.infinity : widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(
          color: isDark ? Colors.white.withOpacity(0.3) : AppColors.primaryBlue,
          width: 2,
        ),
      ),
      child: _buildContent(isDark ? Colors.white : AppColors.primaryBlue),
    );
  }

  Widget _buildGradientButton(bool isDark) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: widget.isExpanded ? double.infinity : widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primaryBlue, AppColors.gradientEnd],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryBlue.withOpacity(0.4),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: _buildContent(Colors.white),
        ),
      ),
    );
  }

  Widget _buildContent(Color color) {
    return Center(
      child: widget.isLoading
          ? SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null) ...[
                  Icon(widget.icon, color: color, size: 20),
                  const SizedBox(width: 8),
                ],
                Text(
                  widget.text,
                  style: TextStyle(
                    color: color,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
    );
  }
}

class GlassIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final double size;
  final Color? iconColor;
  final bool showGlassBackground;

  const GlassIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.size = 48,
    this.iconColor,
    this.showGlassBackground = true,
  });

  @override
  State<GlassIconButton> createState() => _GlassIconButtonState();
}

class _GlassIconButtonState extends State<GlassIconButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedScale(
        scale: _isPressed ? 0.9 : 1.0,
        duration: AppConstants.animationFast,
        child: widget.showGlassBackground
            ? ClipRRect(
                borderRadius: BorderRadius.circular(widget.size / 2),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: widget.size,
                    height: widget.size,
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.white.withOpacity(0.1)
                          : Colors.white.withOpacity(0.6),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      widget.icon,
                      color: widget.iconColor ??
                          (isDark ? Colors.white : AppColors.primaryBlue),
                      size: widget.size * 0.5,
                    ),
                  ),
                ),
              )
            : IconButton(
                onPressed: widget.onPressed,
                icon: Icon(widget.icon),
                color: widget.iconColor ??
                    (isDark ? Colors.white : AppColors.primaryBlue),
                iconSize: widget.size * 0.5,
              ),
      ),
    );
  }
}
