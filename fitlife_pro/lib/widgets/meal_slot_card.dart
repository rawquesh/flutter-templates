import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class MealSlotCard extends StatelessWidget {
  final String mealType;
  final IconData icon;
  final List<MealItem> meals;
  final VoidCallback? onAddMeal;
  final VoidCallback? onRemoveMeal;
  final double totalCalories;

  const MealSlotCard({
    super.key,
    required this.mealType,
    required this.icon,
    required this.meals,
    this.onAddMeal,
    this.onRemoveMeal,
    required this.totalCalories,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.white.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.1)
                  : Colors.grey.shade200,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.primaryOrange.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(icon, color: AppColors.primaryOrange, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mealType,
                          style: TextStyle(
                            color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${totalCalories.toInt()} cal',
                          style: TextStyle(
                            color: isDark ? Colors.white60 : Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: onAddMeal,
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryOrange.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: AppColors.primaryOrange,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              if (meals.isNotEmpty) ...[
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 8),
                ...meals.map((meal) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  meal.name,
                                  style: TextStyle(
                                    color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '${meal.servingSize} • ${meal.calories.toInt()} cal',
                                  style: TextStyle(
                                    color: isDark ? Colors.white60 : Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: onRemoveMeal,
                            icon: Icon(
                              Icons.close,
                              color: isDark ? Colors.white38 : Colors.grey,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class MealItem {
  final String name;
  final String servingSize;
  final double calories;

  const MealItem({
    required this.name,
    required this.servingSize,
    required this.calories,
  });
}
