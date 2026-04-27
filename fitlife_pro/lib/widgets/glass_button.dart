import 'package:flutter/material.dart';
import '../theme/colors.dart';

enum GlassButtonType { primary, secondary, outline, gradient }

class GlassButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final GlassButtonType type;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final bool isLoading;
  final IconData? icon;
  final double? width;
  final double height;

  const GlassButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = GlassButtonType.primary,
    this.borderRadius = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    this.isLoading = false,
    this.icon,
    this.width,
    this.height = 52,
  });

  @override
  State<GlassButton> createState() => _GlassButtonState();
}

class _GlassButtonState extends State<GlassButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      onTap: widget.isLoading ? null : widget.onPressed,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          );
        },
        child: _buildButton(),
      ),
    );
  }

  Widget _buildButton() {
    final buttonStyle = _getButtonStyle();

    if (widget.width != null || widget.height != 52) {
      return SizedBox(
        width: widget.width,
        height: widget.height,
        child: buttonStyle,
      );
    }

    return buttonStyle;
  }

  Widget _getButtonStyle() {
    switch (widget.type) {
      case GlassButtonType.primary:
        return _buildPrimaryButton();
      case GlassButtonType.secondary:
        return _buildSecondaryButton();
      case GlassButtonType.outline:
        return _buildOutlineButton();
      case GlassButtonType.gradient:
        return _buildGradientButton();
    }
  }

  Widget _buildPrimaryButton() {
    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(
        color: AppColors.primaryOrange,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryOrange.withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: _buildContent(Colors.white),
    );
  }

  Widget _buildSecondaryButton() {
    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
        ),
      ),
      child: _buildContent(Colors.white),
    );
  }

  Widget _buildOutlineButton() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(
          color: isDark ? Colors.white.withValues(alpha: 0.3) : AppColors.primaryOrange,
        ),
      ),
      child: _buildContent(isDark ? Colors.white : AppColors.primaryOrange),
    );
  }

  Widget _buildGradientButton() {
    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryOrange.withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: _buildContent(Colors.white),
    );
  }

  Widget _buildContent(Color textColor) {
    if (widget.isLoading) {
      return Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(textColor),
          ),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.icon != null) ...[
          Icon(widget.icon, color: textColor, size: 20),
          const SizedBox(width: 8),
        ],
        Text(
          widget.text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
