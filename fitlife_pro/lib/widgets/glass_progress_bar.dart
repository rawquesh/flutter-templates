import 'package:flutter/material.dart';
import '../theme/colors.dart';

class GlassProgressBar extends StatefulWidget {
  final double progress;
  final double height;
  final Color? progressColor;
  final Color? backgroundColor;
  final Gradient? gradient;
  final BorderRadius? borderRadius;
  final bool animate;
  final Duration animationDuration;

  const GlassProgressBar({
    super.key,
    required this.progress,
    this.height = 8,
    this.progressColor,
    this.backgroundColor,
    this.gradient,
    this.borderRadius,
    this.animate = true,
    this.animationDuration = const Duration(milliseconds: 1000),
  });

  @override
  State<GlassProgressBar> createState() => _GlassProgressBarState();
}

class _GlassProgressBarState extends State<GlassProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: widget.progress).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    if (widget.animate) {
      _controller.forward();
    } else {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(GlassProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progress != widget.progress) {
      _animation = Tween<double>(
        begin: oldWidget.progress,
        end: widget.progress,
      ).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
      );
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final radius = widget.borderRadius ?? BorderRadius.circular(widget.height / 2);

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.backgroundColor ??
                (isDark
                    ? Colors.white.withValues(alpha: 0.1)
                    : Colors.grey.shade200),
            borderRadius: radius,
          ),
          child: ClipRRect(
            borderRadius: radius,
            child: Align(
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: _animation.value.clamp(0.0, 1.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.gradient == null
                        ? (widget.progressColor ?? AppColors.primaryOrange)
                        : null,
                    gradient: widget.gradient,
                    borderRadius: radius,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class GlassMacroBar extends StatelessWidget {
  final String label;
  final double progress;
  final String currentValue;
  final String targetValue;
  final Color color;

  const GlassMacroBar({
    super.key,
    required this.label,
    required this.progress,
    required this.currentValue,
    required this.targetValue,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                color: isDark ? Colors.white70 : Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '$currentValue / $targetValue',
              style: TextStyle(
                color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        GlassProgressBar(
          progress: progress,
          progressColor: color,
          height: 6,
        ),
      ],
    );
  }
}
