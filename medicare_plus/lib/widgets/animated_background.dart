import 'dart:math';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;
  final bool enableAnimation;

  const AnimatedBackground({
    super.key,
    this.child = const SizedBox(),
    this.enableAnimation = true,
  });

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  final List<_Blob> _blobs = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    if (widget.enableAnimation) {
      _generateBlobs();
      _controller.repeat();
    }
  }

  void _generateBlobs() {
    final random = Random();
    for (int i = 0; i < 5; i++) {
      _blobs.add(_Blob(
        x: random.nextDouble(),
        y: random.nextDouble(),
        size: 100 + random.nextDouble() * 200,
        color: [
          AppColors.primaryBlue,
          AppColors.teal,
          AppColors.gradientEnd,
          AppColors.primaryBlueLight,
          AppColors.tealLight,
        ][random.nextInt(5)],
        speed: 0.5 + random.nextDouble() * 0.5,
        amplitude: 20 + random.nextDouble() * 30,
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
        _buildGradientBackground(),
        if (widget.enableAnimation) ...[
          for (int i = 0; i < _blobs.length; i++)
            _AnimatedBlob(
              blob: _blobs[i],
              controller: _controller,
              index: i,
            ),
        ],
        widget.child,
      ],
    );
  }

  Widget _buildGradientBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.gradientStart,
            AppColors.gradientMiddle,
            AppColors.gradientEnd,
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}

class _Blob {
  final double x;
  final double y;
  final double size;
  final Color color;
  final double speed;
  final double amplitude;

  _Blob({
    required this.x,
    required this.y,
    required this.size,
    required this.color,
    required this.speed,
    required this.amplitude,
  });
}

class _AnimatedBlob extends StatelessWidget {
  final _Blob blob;
  final AnimationController controller;
  final int index;

  const _AnimatedBlob({
    required this.blob,
    required this.controller,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final screenSize = MediaQuery.of(context).size;
        final offsetX = sin(controller.value * 2 * pi + index) * blob.amplitude;
        final offsetY = cos(controller.value * 2 * pi + index * 1.5) * blob.amplitude;

        return Positioned(
          left: screenSize.width * blob.x + offsetX,
          top: screenSize.height * blob.y + offsetY,
          child: Opacity(
            opacity: 0.3,
            child: Container(
              width: blob.size,
              height: blob.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    blob.color,
                    blob.color.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class GradientBackground extends StatelessWidget {
  final Widget child;
  final List<Color>? colors;
  final List<double>? stops;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  const GradientBackground({
    super.key,
    required this.child,
    this.colors,
    this.stops,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: colors ??
              const [
                AppColors.gradientStart,
                AppColors.gradientMiddle,
                AppColors.gradientEnd,
              ],
          stops: stops,
        ),
      ),
      child: child,
    );
  }
}

class MeshGradientBackground extends StatelessWidget {
  final Widget child;

  const MeshGradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF1A237E),
                Color(0xFF0D47A1),
                Color(0xFF006064),
              ],
            ),
          ),
        ),
        Positioned(
          top: -100,
          right: -100,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.primaryBlue.withOpacity(0.4),
                  AppColors.primaryBlue.withOpacity(0),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -150,
          left: -100,
          child: Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.teal.withOpacity(0.3),
                  AppColors.teal.withOpacity(0),
                ],
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
