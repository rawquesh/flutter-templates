import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;
  final bool animate;

  const AnimatedBackground({
    super.key,
    required this.child,
    this.animate = true,
  });

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late List<_FloatingElement> _elements;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    _elements = List.generate(15, (index) => _FloatingElement.random());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: AppColors.loginBackgroundGradient,
          ),
        ),
        if (widget.animate)
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                size: MediaQuery.of(context).size,
                painter: _FloatingElementsPainter(
                  elements: _elements,
                  animation: _controller.value,
                ),
              );
            },
          ),
        widget.child,
      ],
    );
  }
}

class _FloatingElement {
  final double x;
  final double y;
  final double size;
  final IconData icon;
  final double speed;
  final double amplitude;

  _FloatingElement({
    required this.x,
    required this.y,
    required this.size,
    required this.icon,
    required this.speed,
    required this.amplitude,
  });

  factory _FloatingElement.random() {
    final random = math.Random();
    final icons = [
      Icons.fitness_center,
      Icons.directions_run,
      Icons.favorite,
      Icons.sports_gymnastics,
      Icons.sports,
      Icons.timer,
      Icons.local_fire_department,
    ];

    return _FloatingElement(
      x: random.nextDouble(),
      y: random.nextDouble(),
      size: 20 + random.nextDouble() * 30,
      icon: icons[random.nextInt(icons.length)],
      speed: 0.5 + random.nextDouble() * 1.5,
      amplitude: 0.02 + random.nextDouble() * 0.03,
    );
  }
}

class _FloatingElementsPainter extends CustomPainter {
  final List<_FloatingElement> elements;
  final double animation;

  _FloatingElementsPainter({
    required this.elements,
    required this.animation,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final element in elements) {
      final offsetY = math.sin((animation * 2 * math.pi + element.y) * element.speed) *
          size.height *
          element.amplitude;
      final offsetX = math.cos((animation * 2 * math.pi + element.x) * element.speed * 0.5) *
          size.width *
          element.amplitude *
          0.5;

      final paint = Paint()
        ..color = Colors.white.withValues(alpha: 0.05)
        ..style = PaintingStyle.fill;

      canvas.save();
      canvas.translate(
        element.x * size.width + offsetX,
        element.y * size.height + offsetY,
      );
      canvas.rotate(animation * math.pi * 2 * element.speed);
      canvas.drawCircle(Offset.zero, element.size / 2, paint);

      final textPainter = TextPainter(
        text: TextSpan(
          text: String.fromCharCode(element.icon.codePoint),
          style: TextStyle(
            fontSize: element.size * 0.6,
            fontFamily: element.icon.fontFamily,
            color: Colors.white.withValues(alpha: 0.08),
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(-textPainter.width / 2, -textPainter.height / 2),
      );

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _FloatingElementsPainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}

class GradientBackground extends StatelessWidget {
  final Widget child;
  final List<Color>? colors;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  const GradientBackground({
    super.key,
    required this.child,
    this.colors,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors ?? [
            const Color(0xFF1A1A2E),
            const Color(0xFF16213E),
            const Color(0xFF0F3460),
          ],
          begin: begin,
          end: end,
        ),
      ),
      child: child,
    );
  }
}
