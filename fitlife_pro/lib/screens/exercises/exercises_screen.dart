import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/exercise_card.dart';
import 'exercise_detail_screen.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  String _searchQuery = '';
  final Set<int> _selectedMuscleGroups = {};
  int? _expandedExerciseIndex;

  final List<String> _muscleGroups = [
    'All', 'Chest', 'Back', 'Legs', 'Arms', 'Core', 'Full Body'
  ];

  final List<Map<String, String>> _exercises = [
    {'name': 'Push-ups', 'muscle': 'Chest', 'difficulty': 'Easy', 'instructions': 'Classic upper body exercise targeting chest, shoulders, and triceps.'},
    {'name': 'Pull-ups', 'muscle': 'Back', 'difficulty': 'Hard', 'instructions': 'Compound exercise targeting latissimus dorsi and biceps.'},
    {'name': 'Squats', 'muscle': 'Legs', 'difficulty': 'Medium', 'instructions': 'Fundamental lower body movement for quad, hamstring, and glute development.'},
    {'name': 'Deadlifts', 'muscle': 'Back', 'difficulty': 'Hard', 'instructions': 'Full body compound movement focusing on posterior chain.'},
    {'name': 'Bench Press', 'muscle': 'Chest', 'difficulty': 'Medium', 'instructions': 'Primary chest exercise with dumbbells or barbell.'},
    {'name': 'Lunges', 'muscle': 'Legs', 'difficulty': 'Medium', 'instructions': 'Unilateral leg exercise for strength and balance.'},
    {'name': 'Plank', 'muscle': 'Core', 'difficulty': 'Easy', 'instructions': 'Isometric core stabilization exercise.'},
    {'name': 'Burpees', 'muscle': 'Full Body', 'difficulty': 'Hard', 'instructions': 'High-intensity full body cardio exercise.'},
    {'name': 'Bicep Curls', 'muscle': 'Arms', 'difficulty': 'Easy', 'instructions': 'Isolation exercise for bicep development.'},
    {'name': 'Tricep Dips', 'muscle': 'Arms', 'difficulty': 'Medium', 'instructions': 'Bodyweight exercise targeting triceps.'},
    {'name': 'Mountain Climbers', 'muscle': 'Core', 'difficulty': 'Medium', 'instructions': 'Dynamic core exercise with cardio benefits.'},
    {'name': 'Leg Press', 'muscle': 'Legs', 'difficulty': 'Medium', 'instructions': 'Machine-based quad dominant exercise.'},
  ];

  List<Map<String, String>> get _filteredExercises {
    var filtered = _exercises;
    if (_selectedMuscleGroups.isNotEmpty) {
      filtered = filtered.where((e) {
        final muscleIndex = _muscleGroups.indexOf(e['muscle']!);
        return _selectedMuscleGroups.contains(muscleIndex);
      }).toList();
    }
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((e) => e['name']!.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
    }
    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0D0D1A) : const Color(0xFFF5F5F7),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildHeader()),
            SliverToBoxAdapter(child: _buildSearchBar()),
            SliverToBoxAdapter(child: _buildMuscleGroupFilters()),
            SliverToBoxAdapter(child: _buildExerciseList()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Exercise Library',
            style: TextStyle(
              color: isDark ? Colors.white : const Color(0xFF1A1A2E),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Browse exercises by muscle group',
            style: TextStyle(
              color: isDark ? Colors.white60 : Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms);
  }

  Widget _buildSearchBar() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark ? Colors.white.withValues(alpha: 0.1) : Colors.grey.shade200,
          ),
        ),
        child: TextField(
          onChanged: (value) => setState(() => _searchQuery = value),
          style: TextStyle(color: isDark ? Colors.white : const Color(0xFF1A1A2E)),
          decoration: InputDecoration(
            hintText: 'Search exercises...',
            hintStyle: TextStyle(color: isDark ? Colors.white38 : Colors.grey),
            prefixIcon: Icon(Icons.search, color: isDark ? Colors.white54 : Colors.grey),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ),
    ).animate().fadeIn(delay: 100.ms, duration: 600.ms);
  }

  Widget _buildMuscleGroupFilters() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _muscleGroups.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedMuscleGroups.contains(index);
          return GestureDetector(
            onTap: () {
              setState(() {
                if (index == 0) {
                  _selectedMuscleGroups.clear();
                } else {
                  if (isSelected) {
                    _selectedMuscleGroups.remove(index);
                  } else {
                    _selectedMuscleGroups.add(index);
                  }
                }
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: _selectedMuscleGroups.isEmpty && index == 0
                    ? AppColors.primaryOrange
                    : (isSelected ? AppColors.primaryOrange : Colors.transparent),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: _selectedMuscleGroups.isEmpty && index == 0
                      ? AppColors.primaryOrange
                      : (isSelected ? AppColors.primaryOrange : Colors.grey.withValues(alpha: 0.3)),
                ),
              ),
              child: Text(
                _muscleGroups[index],
                style: TextStyle(
                  color: (_selectedMuscleGroups.isEmpty && index == 0) || isSelected
                      ? Colors.white
                      : Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    ).animate().fadeIn(delay: 200.ms, duration: 600.ms);
  }

  Widget _buildExerciseList() {
    final exercises = _filteredExercises;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(20),
      itemCount: exercises.length,
      itemBuilder: (context, index) {
        final exercise = exercises[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: ExerciseCard(
            name: exercise['name']!,
            muscleGroup: exercise['muscle']!,
            difficulty: exercise['difficulty']!,
            instructions: exercise['instructions'],
            isExpanded: _expandedExerciseIndex == index,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ExerciseDetailScreen(
                    exerciseName: exercise['name']!,
                    muscleGroup: exercise['muscle']!,
                    difficulty: exercise['difficulty']!,
                    instructions: exercise['instructions']!,
                  ),
                ),
              );
            },
            onExpand: () {
              setState(() {
                _expandedExerciseIndex = _expandedExerciseIndex == index ? null : index;
              });
            },
          ),
        ).animate().fadeIn(delay: (300 + index * 50).ms, duration: 600.ms);
      },
    );
  }
}
