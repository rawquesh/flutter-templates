import 'dart:math';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;
  final List<Color> gradientColors;

  const AnimatedBackground({
    super.key,
    required this.child,
    this.gradientColors = AppColors.loginGradient,
  });

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  final List<_FloatingIcon> _icons = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    _generateIcons();
  }

  void _generateIcons() {
    final iconData = [
      Icons.local_pizza,
      Icons.lunch_dining,
      Icons.ramen_dining,
      Icons.restaurant,
      Icons.local_cafe,
      Icons.local_drink,
      Icons.cake,
      Icons.icecream,
      Icons.local_pizza_outlined,
      Icons.fastfood,
    ];

    for (int i = 0; i < 15; i++) {
      _icons.add(_FloatingIcon(
        icon: iconData[_random.nextInt(iconData.length)],
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        size: 20 + _random.nextDouble() * 30,
        speed: 0.5 + _random.nextDouble() * 0.5,
        delay: _random.nextDouble() * 5,
      ));
    }
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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: widget.gradientColors,
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: _WavePainter(
                progress: _controller.value,
                color: Colors.white.withValues(alpha: 0.1),
              ),
              size: Size.infinite,
            );
          },
        ),
        ..._icons.map((iconData) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final offset = sin(
                    (_controller.value + iconData.delay) *
                        2 *
                        pi *
                        iconData.speed,
                  ) *
                  0.05;
              return Positioned(
                left: iconData.x * MediaQuery.of(context).size.width,
                top: (iconData.y + offset) * MediaQuery.of(context).size.height,
                child: Opacity(
                  opacity: 0.15,
                  child: Icon(
                    iconData.icon,
                    size: iconData.size,
                    color: Colors.white,
                  ),
                ),
              );
            },
          );
        }),
        widget.child,
      ],
    );
  }
}

class _FloatingIcon {
  final IconData icon;
  final double x;
  final double y;
  final double size;
  final double speed;
  final double delay;

  _FloatingIcon({
    required this.icon,
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.delay,
  });
}

class _WavePainter extends CustomPainter {
  final double progress;
  final Color color;

  _WavePainter({
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * 0.7);

    for (double x = 0; x <= size.width; x++) {
      final y = size.height * 0.7 +
          sin((x / size.width + progress) * 4 * pi) * 20;
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _WavePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class GlowingOrb extends StatefulWidget {
  final double size;
  final Color color;
  final double blur;

  const GlowingOrb({
    super.key,
    this.size = 200,
    this.color = AppColors.primaryOrange,
    this.blur = 60,
  });

  @override
  State<GlowingOrb> createState() => _GlowingOrbState();
}

class _GlowingOrbState extends State<GlowingOrb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.3, end: 0.6).animate(
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
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: widget.color.withValues(alpha: _animation.value),
                blurRadius: widget.blur,
                spreadRadius: widget.blur / 3,
              ),
            ],
          ),
        );
      },
    );
  }
}
