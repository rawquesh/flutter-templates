import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../../widgets/category_card.dart';
import '../../utils/constants.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final icons = [
      Icons.checkroom, Icons.devices, Icons.home, Icons.sports,
      Icons.spa, Icons.book, Icons.toys, Icons.restaurant,
      Icons.pets, Icons.directions_car,
    ];
    final colors = [
      AppColors.primaryBlue, AppColors.accentCoral, AppColors.success,
      AppColors.warning, Colors.purple, Colors.brown,
      Colors.teal, Colors.orange, Colors.indigo, Colors.blueGrey,
    ];

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Categories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: AppConstants.categoryNames.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            name: AppConstants.categoryNames[index],
            icon: icons[index],
            itemCount: 50 + (index * 23),
            backgroundColor: colors[index],
          );
        },
      ),
    );
  }
}
