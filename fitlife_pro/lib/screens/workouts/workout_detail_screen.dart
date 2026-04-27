import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_button.dart';
import '../../widgets/exercise_card.dart';
import '../active_workout/active_workout_screen.dart';

class WorkoutDetailScreen extends StatefulWidget {
  final String workoutName;
  final String workoutType;
  final String duration;
  final int difficulty;
  final String calories;
  final int exerciseCount;

  const WorkoutDetailScreen({
    super.key,
    required this.workoutName,
    required this.workoutType,
    required this.duration,
    required this.difficulty,
    required this.calories,
    required this.exerciseCount,
  });

  @override
  State<WorkoutDetailScreen> createState() => _WorkoutDetailScreenState();
}

class _WorkoutDetailScreenState extends State<WorkoutDetailScreen> {
  bool _isFavorite = false;
  int? _expandedExerciseIndex;

  final List<Map<String, String>> _warmupExercises = [
    {'name': 'Jumping Jacks', 'duration': '30 sec'},
    {'name': 'High Knees', 'duration': '30 sec'},
    {'name': 'Arm Circles', 'duration': '30 sec'},
    {'name': 'Leg Swings', 'duration': '30 sec'},
  ];

  final List<Map<String, String>> _exercises = [
    {'name': 'Burpees', 'sets': '3', 'reps': '12', 'rest': '60 sec', 'instructions': 'Start standing, drop into a squat with hands on the floor, jump feet back to plank, do a push-up, jump feet forward, and jump up with arms overhead.'},
    {'name': 'Mountain Climbers', 'sets': '3', 'reps': '20', 'rest': '45 sec', 'instructions': 'Start in plank position. Alternate driving knees toward chest rapidly while maintaining a straight back.'},
    {'name': 'Jump Squats', 'sets': '3', 'reps': '15', 'rest': '60 sec', 'instructions': 'Perform a regular squat, then explosively jump up, reaching arms overhead. Land softly and immediately go into the next rep.'},
    {'name': 'Push-ups', 'sets': '3', 'reps': '15', 'rest': '45 sec', 'instructions': 'Start in plank position with hands shoulder-width apart. Lower chest to ground keeping body straight, then push back up.'},
    {'name': 'Plank Hold', 'sets': '3', 'reps': '45 sec', 'rest': '30 sec', 'instructions': 'Hold a push-up position with forearms on ground, keeping body in a straight line from head to heels.'},
    {'name': 'Lunges', 'sets': '3', 'reps': '12 each', 'rest': '45 sec', 'instructions': 'Step forward with one leg, lowering hips until both knees are bent at 90 degrees. Push back to start and alternate legs.'},
    {'name': 'Bicycle Crunches', 'sets': '3', 'reps': '20 each', 'rest': '45 sec', 'instructions': 'Lie on back with hands behind head. Bring opposite elbow to knee while extending the other leg, then alternate in a pedaling motion.'},
    {'name': 'Burpee Box Jumps', 'sets': '3', 'reps': '10', 'rest': '60 sec', 'instructions': 'Perform a burpee, then jump onto a box or elevated surface. Step or jump back down and repeat.'},
  ];

  final List<String> _equipment = ['Dumbbells', 'Pull-up Bar', 'Jump Rope', 'Exercise Mat'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(isDark),
          SliverToBoxAdapter(
            child: Column(
              children: [
                _buildInfoBar(isDark),
                _buildDescription(isDark),
                _buildWarmupSection(isDark),
                _buildExerciseList(isDark),
                _buildEquipmentSection(isDark),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildSliverAppBar(bool isDark) {
    return SliverAppBar(
      expandedHeight: 250,
      pinned: true,
      backgroundColor: isDark ? const Color(0xFF0D0D1A) : const Color(0xFFF5F5F7),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.arrow_back, color: isDark ? Colors.white : const Color(0xFF1A1A2E), size: 20),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => setState(() => _isFavorite = !_isFavorite),
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : (isDark ? Colors.white : const Color(0xFF1A1A2E)),
              size: 20,
            ),
          ),
        ),
        const SizedBox(width: 8),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primaryOrange.withValues(alpha: 0.8),
                AppColors.primaryRedOrange.withValues(alpha: 0.6),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: _CircuitPainter(),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.fitness_center, color: Colors.white, size: 48),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.workoutName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        widget.workoutType,
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBar(bool isDark) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.grey.shade200,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildInfoItem(Icons.timer, widget.duration, 'Duration'),
          _buildDivider(),
          _buildInfoItem(Icons.local_fire_department, widget.calories, 'Calories'),
          _buildDivider(),
          _buildInfoItem(Icons.fitness_center, '${widget.exerciseCount}', 'Exercises'),
          _buildDivider(),
          _buildDifficultyItem(),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms);
  }

  Widget _buildInfoItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primaryOrange, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white54, fontSize: 11),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.white.withValues(alpha: 0.2),
    );
  }

  Widget _buildDifficultyItem() {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) => Icon(
            Icons.star,
            color: index < widget.difficulty ? AppColors.warning : Colors.white.withValues(alpha: 0.3),
            size: 16,
          )),
        ),
        const SizedBox(height: 8),
        const Text(
          'Difficulty',
          style: TextStyle(color: Colors.white54, fontSize: 11),
        ),
      ],
    );
  }

  Widget _buildDescription(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About this workout',
            style: TextStyle(
              color: isDark ? Colors.white : const Color(0xFF1A1A2E),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'This high-intensity workout is designed to maximize calorie burn and build endurance. Perfect for those looking to challenge themselves and push their limits.',
            style: TextStyle(
              color: isDark ? Colors.white70 : Colors.grey,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 100.ms, duration: 600.ms);
  }

  Widget _buildWarmupSection(bool isDark) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.whatshot, color: AppColors.warning, size: 20),
              const SizedBox(width: 8),
              Text(
                'Warm-up',
                style: TextStyle(
                  color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...List.generate(_warmupExercises.length, (index) {
            final exercise = _warmupExercises[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.warning.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.warning.withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.warning.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text('${index + 1}', style: const TextStyle(color: AppColors.warning, fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: Text(exercise['name']!, style: TextStyle(color: isDark ? Colors.white : const Color(0xFF1A1A2E), fontSize: 14))),
                  Text(exercise['duration']!, style: const TextStyle(color: AppColors.warning, fontSize: 12)),
                ],
              ),
            );
          }),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms, duration: 600.ms);
  }

  Widget _buildExerciseList(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.fitness_center, color: AppColors.primaryOrange, size: 20),
              const SizedBox(width: 8),
              Text(
                'Exercises',
                style: TextStyle(
                  color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...List.generate(_exercises.length, (index) {
            final exercise = _exercises[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ExerciseCard(
                name: exercise['name']!,
                muscleGroup: 'Full Body',
                difficulty: widget.difficulty > 3 ? 'Hard' : 'Medium',
                sets: exercise['sets'],
                reps: exercise['reps'],
                instructions: exercise['instructions'],
                isExpanded: _expandedExerciseIndex == index,
                onExpand: () {
                  setState(() {
                    _expandedExerciseIndex = _expandedExerciseIndex == index ? null : index;
                  });
                },
              ),
            );
          }),
        ],
      ),
    ).animate().fadeIn(delay: 300.ms, duration: 600.ms);
  }

  Widget _buildEquipmentSection(bool isDark) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Equipment Needed',
            style: TextStyle(
              color: isDark ? Colors.white : const Color(0xFF1A1A2E),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _equipment.map((item) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.accentBlue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.accentBlue.withValues(alpha: 0.3)),
              ),
              child: Text(item, style: const TextStyle(color: AppColors.accentBlue, fontSize: 12)),
            )).toList(),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms, duration: 600.ms);
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
        ),
      ),
      child: SafeArea(
        child: GlassButton(
          text: 'Start Workout',
          icon: Icons.play_arrow,
          type: GlassButtonType.gradient,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ActiveWorkoutScreen(workoutName: widget.workoutName),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CircuitPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    for (int i = 0; i < 5; i++) {
      final rect = Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: 100.0 + (i * 50),
        height: 100.0 + (i * 50),
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(20)),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
