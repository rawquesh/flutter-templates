import 'package:flutter/material.dart';
import '../theme/colors.dart';

class WorkoutTimer extends StatefulWidget {
  final Duration elapsed;
  final bool isRunning;
  final double fontSize;

  const WorkoutTimer({
    super.key,
    required this.elapsed,
    this.isRunning = true,
    this.fontSize = 48,
  });

  @override
  State<WorkoutTimer> createState() => _WorkoutTimerState();
}

class _WorkoutTimerState extends State<WorkoutTimer> {
  @override
  Widget build(BuildContext context) {
    final minutes = widget.elapsed.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = widget.elapsed.inSeconds.remainder(60).toString().padLeft(2, '0');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryOrange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primaryOrange.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            widget.isRunning ? Icons.timer : Icons.timer_off,
            color: AppColors.primaryOrange,
            size: 28,
          ),
          const SizedBox(width: 12),
          Text(
            '$minutes:$seconds',
            style: TextStyle(
              color: Colors.white,
              fontSize: widget.fontSize,
              fontWeight: FontWeight.bold,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }
}

class RestTimerOverlay extends StatelessWidget {
  final int secondsRemaining;
  final int totalSeconds;
  final VoidCallback? onSkip;
  final String? nextExercise;

  const RestTimerOverlay({
    super.key,
    required this.secondsRemaining,
    required this.totalSeconds,
    this.onSkip,
    this.nextExercise,
  });

  @override
  Widget build(BuildContext context) {
    final progress = secondsRemaining / totalSeconds;

    return Container(
      color: Colors.black87,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'REST',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 24,
                fontWeight: FontWeight.w300,
                letterSpacing: 8,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 8,
                      backgroundColor: Colors.white24,
                      valueColor: const AlwaysStoppedAnimation(AppColors.primaryOrange),
                    ),
                  ),
                  Text(
                    secondsRemaining.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 72,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            if (nextExercise != null) ...[
              Text(
                'Next: $nextExercise',
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),
            ],
            TextButton(
              onPressed: onSkip,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white54),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'SKIP REST',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
