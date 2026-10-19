import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';

class ActiveWorkoutScreen extends StatefulWidget {
  final String workoutName;

  const ActiveWorkoutScreen({super.key, required this.workoutName});

  @override
  State<ActiveWorkoutScreen> createState() => _ActiveWorkoutScreenState();
}

class _ActiveWorkoutScreenState extends State<ActiveWorkoutScreen> {
  int _currentExerciseIndex = 0;
  int _currentSet = 1;
  final int _totalSets = 3;
  int _restSeconds = 60;
  bool _isResting = false;
  bool _isPaused = false;
  Duration _elapsed = Duration.zero;
  Timer? _timer;
  Timer? _restTimer;

  final List<Map<String, String>> _exercises = [
    {'name': 'Burpees', 'reps': '12'},
    {'name': 'Mountain Climbers', 'reps': '20'},
    {'name': 'Jump Squats', 'reps': '15'},
    {'name': 'Push-ups', 'reps': '15'},
    {'name': 'Plank Hold', 'reps': '45 sec'},
    {'name': 'Lunges', 'reps': '12'},
    {'name': 'Bicycle Crunches', 'reps': '20'},
    {'name': 'Burpee Box Jumps', 'reps': '10'},
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!_isPaused) {
        setState(() => _elapsed += const Duration(seconds: 1));
      }
    });
  }

  void _togglePause() {
    setState(() => _isPaused = !_isPaused);
  }

  void _completeSet() {
    if (_currentSet < _totalSets) {
      setState(() {
        _currentSet++;
        _isResting = true;
        _restSeconds = 60;
      });
      _startRestTimer();
    } else {
      _nextExercise();
    }
  }

  void _startRestTimer() {
    _restTimer?.cancel();
    _restTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_restSeconds > 0) {
        setState(() => _restSeconds--);
      } else {
        _restTimer?.cancel();
        setState(() => _isResting = false);
      }
    });
  }

  void _skipRest() {
    _restTimer?.cancel();
    setState(() {
      _isResting = false;
      _restSeconds = 60;
    });
  }

  void _nextExercise() {
    if (_currentExerciseIndex < _exercises.length - 1) {
      setState(() {
        _currentExerciseIndex++;
        _currentSet = 1;
      });
    } else {
      _finishWorkout();
    }
  }

  void _previousExercise() {
    if (_currentExerciseIndex > 0) {
      setState(() {
        _currentExerciseIndex--;
        _currentSet = 1;
      });
    }
  }

  void _finishWorkout() {
    _timer?.cancel();
    _restTimer?.cancel();
    _showWorkoutSummary();
  }

  void _showWorkoutSummary() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildWorkoutSummary(),
    );
  }

  Widget _buildWorkoutSummary() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, color: AppColors.success, size: 48),
          ),
          const SizedBox(height: 16),
          const Text(
            'Workout Complete!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSummaryItem(_formatDuration(_elapsed), 'Duration'),
              _buildSummaryItem('${_exercises.length}', 'Exercises'),
              _buildSummaryItem('${_exercises.length * 3}', 'Sets'),
              _buildSummaryItem('320', 'Calories'),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Achievements Unlocked',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAchievementBadge(Icons.local_fire_department, 'First Workout'),
              const SizedBox(width: 12),
              _buildAchievementBadge(Icons.bolt, 'Speed Demon'),
              const SizedBox(width: 12),
              _buildAchievementBadge(Icons.star, '+100 XP'),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryOrange,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Done', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white54, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildAchievementBadge(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.warning.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.warning, size: 24),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 10)),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    _restTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isResting) {
      return _buildRestOverlay();
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D1A),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(child: _buildMainContent()),
            _buildControls(),
          ],
        ),
      ),
    );
  }

  Widget _buildRestOverlay() {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'REST',
              style: TextStyle(
                color: Colors.white54,
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
                      value: _restSeconds / 60,
                      strokeWidth: 8,
                      backgroundColor: Colors.white24,
                      valueColor: const AlwaysStoppedAnimation(AppColors.primaryOrange),
                    ),
                  ),
                  Text(
                    '$_restSeconds',
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
            if (_currentExerciseIndex < _exercises.length - 1)
              Text(
                'Next: ${_exercises[_currentExerciseIndex + 1]['name']}',
                style: const TextStyle(color: Colors.white54, fontSize: 16),
              ),
            const SizedBox(height: 40),
            TextButton(
              onPressed: _skipRest,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white54),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'SKIP REST',
                  style: TextStyle(color: Colors.white70, fontSize: 16, letterSpacing: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close, color: Colors.white),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  widget.workoutName,
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primaryOrange.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    _formatDuration(_elapsed),
                    style: const TextStyle(color: AppColors.primaryOrange, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: _togglePause,
            icon: Icon(
              _isPaused ? Icons.play_arrow : Icons.pause,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms);
  }

  Widget _buildMainContent() {
    final exercise = _exercises[_currentExerciseIndex];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildProgressIndicator(),
          const SizedBox(height: 24),
          _buildExerciseCard(exercise),
          const SizedBox(height: 24),
          _buildSetProgress(),
          const SizedBox(height: 24),
          _buildUpNext(),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_exercises.length, (index) {
        final isCompleted = index < _currentExerciseIndex;
        final isCurrent = index == _currentExerciseIndex;
        return Container(
          width: isCurrent ? 24 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: isCompleted || isCurrent ? AppColors.primaryOrange : Colors.white24,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    ).animate().fadeIn(duration: 600.ms);
  }

  Widget _buildExerciseCard(Map<String, String> exercise) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryOrange.withValues(alpha: 0.3),
            AppColors.primaryRedOrange.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryOrange.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.fitness_center, color: Colors.white, size: 48),
          ),
          const SizedBox(height: 16),
          Text(
            exercise['name']!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${exercise['reps']} ${exercise['reps']!.contains('sec') ? 'seconds' : 'reps'}',
            style: const TextStyle(color: Colors.white70, fontSize: 18),
          ),
          const SizedBox(height: 16),
          Text(
            'Set $_currentSet of $_totalSets',
            style: const TextStyle(color: AppColors.primaryOrange, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms).scale(begin: const Offset(0.95, 0.95));
  }

  Widget _buildSetProgress() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_totalSets, (index) {
        final isCompleted = index < _currentSet - 1;
        final isCurrent = index == _currentSet - 1;
        return Container(
          width: isCurrent ? 16 : 12,
          height: isCurrent ? 16 : 12,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted ? AppColors.success : (isCurrent ? AppColors.primaryOrange : Colors.white24),
            border: isCurrent ? Border.all(color: Colors.white, width: 2) : null,
          ),
        );
      }),
    ).animate().fadeIn(delay: 100.ms, duration: 600.ms);
  }

  Widget _buildUpNext() {
    if (_currentExerciseIndex >= _exercises.length - 1) return const SizedBox.shrink();

    final nextExercise = _exercises[_currentExerciseIndex + 1];
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Text(
            'Up Next:',
            style: TextStyle(color: Colors.white54, fontSize: 14),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              nextExercise['name']!,
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const Icon(Icons.arrow_forward, color: Colors.white54, size: 20),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms, duration: 600.ms);
  }

  Widget _buildControls() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: _previousExercise,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white54),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.skip_previous, color: Colors.white),
                  SizedBox(width: 8),
                  Text('Previous', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: _completeSet,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryOrange,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Complete Set', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 300.ms, duration: 600.ms);
  }
}
