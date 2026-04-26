import 'dart:math';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;
  final List<Color>? gradientColors;

  const AnimatedBackground({
    super.key,
    required this.child,
    this.gradientColors,
  });

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late List<_FloatingObject> _floatingObjects;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    _floatingObjects = List.generate(15, (index) => _FloatingObject.random());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = widget.gradientColors ?? AppColors.gradientBackgroundDark;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: _FloatingShapesPainter(
                objects: _floatingObjects,
                progress: _controller.value,
              ),
              size: Size.infinite,
            );
          },
        ),
        widget.child,
      ],
    );
  }
}

class _FloatingObject {
  final double x;
  final double y;
  final double size;
  final double speed;
  final double opacity;
  final IconData icon;

  _FloatingObject({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.opacity,
    required this.icon,
  });

  factory _FloatingObject.random() {
    final random = Random();
    final icons = [
      Icons.shopping_bag_outlined,
      Icons.shopping_cart_outlined,
      Icons.local_offer_outlined,
      Icons.percent,
      Icons.card_giftcard,
      Icons.storefront_outlined,
    ];

    return _FloatingObject(
      x: random.nextDouble(),
      y: random.nextDouble(),
      size: 20 + random.nextDouble() * 40,
      speed: 0.2 + random.nextDouble() * 0.8,
      opacity: 0.03 + random.nextDouble() * 0.07,
      icon: icons[random.nextInt(icons.length)],
    );
  }
}

class _FloatingShapesPainter extends CustomPainter {
  final List<_FloatingObject> objects;
  final double progress;

  _FloatingShapesPainter({
    required this.objects,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final obj in objects) {
      final yOffset = (progress * obj.speed) % 1.0;
      final xOffset = sin(progress * pi * 2 * obj.speed) * 0.02;

      final x = (obj.x + xOffset) * size.width;
      final y = ((obj.y + yOffset) % 1.0) * size.height;

      final paint = Paint()
        ..color = Colors.white.withValues(alpha: obj.opacity)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(x, y), obj.size / 2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _FloatingShapesPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class FloatingShape extends StatefulWidget {
  final IconData icon;
  final double size;
  final Color color;
  final Duration duration;

  const FloatingShape({
    super.key,
    required this.icon,
    this.size = 40,
    this.color = Colors.white24,
    this.duration = const Duration(seconds: 3),
  });

  @override
  State<FloatingShape> createState() => _FloatingShapeState();
}

class _FloatingShapeState extends State<FloatingShape>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _floatAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _rotateAnimation = Tween<double>(begin: -0.1, end: 0.1).animate(
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _floatAnimation.value),
          child: Transform.rotate(
            angle: _rotateAnimation.value,
            child: Icon(
              widget.icon,
              size: widget.size,
              color: widget.color,
            ),
          ),
        );
      },
    );
  }
}
