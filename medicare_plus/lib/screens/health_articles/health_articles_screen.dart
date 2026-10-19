import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/glass_chip.dart';

class HealthArticlesScreen extends StatefulWidget {
  final bool isDark;
  const HealthArticlesScreen({super.key, required this.isDark});

  @override
  State<HealthArticlesScreen> createState() => _HealthArticlesScreenState();
}

class _HealthArticlesScreenState extends State<HealthArticlesScreen> {
  int _selectedCategory = 0;
  final Set<String> _bookmarks = {};

  static final List<_Article> _articles = [
    _Article(title: 'Heart Health', subtitle: 'A guide to maintaining a healthy heart', category: 'Disease Prevention', author: 'Dr. Sarah Wilson', readingTime: '8 min', isFeatured: true),
    _Article(title: 'Nutrition Basics', subtitle: 'Essential nutrients your body needs daily', category: 'Nutrition', author: 'Dr. Emily Parker', readingTime: '5 min'),
    _Article(title: 'Workout Routines', subtitle: 'Stay fit without going to the gym', category: 'Fitness', author: 'James Anderson', readingTime: '6 min'),
    _Article(title: 'Managing Anxiety', subtitle: 'Techniques for stress relief', category: 'Mental Health', author: 'Dr. Lisa Thompson', readingTime: '7 min'),
  ];

  static final List<String> _categories = ['All', 'Disease Prevention', 'Nutrition', 'Fitness', 'Mental Health'];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: widget.isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
          title: Text('Health Library', style: TextStyle(color: widget.isDark ? Colors.white : AppColors.textPrimaryLight, fontWeight: FontWeight.bold)),
          actions: [
            IconButton(icon: Icon(Icons.search, color: widget.isDark ? Colors.white : AppColors.textPrimaryLight), onPressed: () {}),
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFeatured(),
                const SizedBox(height: 24),
                _buildCategories(),
                const SizedBox(height: 24),
                _buildGrid(),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatured() {
    final f = _articles.first;
    return Container(
      height: 180,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [AppColors.primaryBlue, AppColors.teal], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
            child: const Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.star, color: Colors.white, size: 14), SizedBox(width: 4), Text('Featured', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))]),
          ),
          const Spacer(),
          Text(f.title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), maxLines: 2),
          const SizedBox(height: 4),
          Text(f.author, style: TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms);
  }

  Widget _buildCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: widget.isDark ? Colors.white : AppColors.textPrimaryLight)),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _categories.asMap().entries.map((e) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GlassChip(label: e.value, isSelected: _selectedCategory == e.key, onTap: () => setState(() => _selectedCategory = e.key)),
            )).toList(),
          ),
        ),
      ],
    ).animate().fadeIn(delay: 100.ms, duration: 400.ms);
  }

  Widget _buildGrid() {
    final filtered = _selectedCategory == 0 ? _articles.skip(1).toList() : _articles.where((a) => a.category == _categories[_selectedCategory] && !a.isFeatured).toList();
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.85, crossAxisSpacing: 12, mainAxisSpacing: 12),
      itemCount: filtered.length,
      itemBuilder: (context, index) => _ArticleCard(article: filtered[index], isDark: widget.isDark, isBookmarked: _bookmarks.contains(filtered[index].title), onBookmark: () => setState(() {
        if (_bookmarks.contains(filtered[index].title)) { _bookmarks.remove(filtered[index].title); } else { _bookmarks.add(filtered[index].title); }
      })),
    );
  }
}

class _Article {
  final String title, subtitle, category, author, readingTime;
  final bool isFeatured;
  _Article({required this.title, required this.subtitle, required this.category, required this.author, required this.readingTime, this.isFeatured = false});
}

class _ArticleCard extends StatelessWidget {
  final _Article article;
  final bool isDark, isBookmarked;
  final VoidCallback onBookmark;
  const _ArticleCard({required this.article, required this.isDark, required this.isBookmarked, required this.onBookmark});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [AppColors.primaryBlue, AppColors.teal]),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  Center(child: Icon(Icons.article, color: Colors.white54, size: 40)),
                  Positioned(top: 4, right: 4, child: GestureDetector(onTap: onBookmark, child: Container(padding: const EdgeInsets.all(4), decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border, color: AppColors.primaryBlue, size: 18)))),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(article.category, style: const TextStyle(fontSize: 10, color: AppColors.primaryBlue, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(article.title, style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppColors.textPrimaryLight), maxLines: 2, overflow: TextOverflow.ellipsis),
          const Spacer(),
          Row(children: [Icon(Icons.access_time, size: 12, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight), const SizedBox(width: 4), Text(article.readingTime, style: TextStyle(fontSize: 11, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight))]),
        ],
      ),
    );
  }
}
