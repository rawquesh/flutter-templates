import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class MacroRing extends StatelessWidget {
  final double protein;
  final double carbs;
  final double fats;
  final double size;

  const MacroRing({
    super.key,
    required this.protein,
    required this.carbs,
    required this.fats,
    this.size = 120,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _MacroRingPainter(
          protein: protein,
          carbs: carbs,
          fats: fats,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${(protein + carbs + fats).toInt()}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'g total',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MacroRingPainter extends CustomPainter {
  final double protein;
  final double carbs;
  final double fats;

  _MacroRingPainter({
    required this.protein,
    required this.carbs,
    required this.fats,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - 24) / 2;
    const strokeWidth = 12.0;

    final total = protein + carbs + fats;
    if (total == 0) return;

    final proteinAngle = 2 * math.pi * (protein / total);
    final carbsAngle = 2 * math.pi * (carbs / total);
    final fatsAngle = 2 * math.pi * (fats / total);

    final backgroundPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    double startAngle = -math.pi / 2;

    void drawSegment(double angle, Color color) {
      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        angle,
        false,
        paint,
      );
      startAngle += angle;
    }

    drawSegment(proteinAngle, AppColors.progressProtein);
    drawSegment(carbsAngle, AppColors.progressCarbs);
    drawSegment(fatsAngle, AppColors.progressFats);
  }

  @override
  bool shouldRepaint(covariant _MacroRingPainter oldDelegate) {
    return oldDelegate.protein != protein ||
        oldDelegate.carbs != carbs ||
        oldDelegate.fats != fats;
  }
}

class MacroLegend extends StatelessWidget {
  final double protein;
  final double carbs;
  final double fats;
  final double proteinGoal;
  final double carbsGoal;
  final double fatsGoal;

  const MacroLegend({
    super.key,
    required this.protein,
    required this.carbs,
    required this.fats,
    required this.proteinGoal,
    required this.carbsGoal,
    required this.fatsGoal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLegendItem(
          'Protein',
          protein,
          proteinGoal,
          AppColors.progressProtein,
          'g',
        ),
        const SizedBox(height: 12),
        _buildLegendItem(
          'Carbs',
          carbs,
          carbsGoal,
          AppColors.progressCarbs,
          'g',
        ),
        const SizedBox(height: 12),
        _buildLegendItem(
          'Fats',
          fats,
          fatsGoal,
          AppColors.progressFats,
          'g',
        ),
      ],
    );
  }

  Widget _buildLegendItem(
    String label,
    double current,
    double goal,
    Color color,
    String unit,
  ) {
    final progress = goal > 0 ? (current / goal).clamp(0.0, 1.0) : 0.0;

    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '${current.toInt()}/${goal.toInt()}$unit',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Container(
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: progress,
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
