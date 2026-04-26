import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/colors.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/glass_bottom_nav.dart';
import '../../widgets/glass_sidebar.dart';
import '../../widgets/glass_toggle.dart';
import '../../widgets/glass_chip.dart';
import '../../theme/app_theme.dart';

class HealthArticlesScreen extends StatefulWidget {
  const HealthArticlesScreen({super.key});

  @override
  State<HealthArticlesScreen> createState() => _HealthArticlesScreenState();
}

class _HealthArticlesScreenState extends State<HealthArticlesScreen> {
  bool _isDark = true;
  int _selectedCategory = 0;
  final Set<String> _bookmarkedArticles = {};

  final List<_Article> _articles = [
    _Article(title: 'Understanding Heart Health', subtitle: 'A comprehensive guide to maintaining a healthy heart', category: 'Disease Prevention', author: 'Dr. Sarah Wilson', readingTime: '8 min', isFeatured: true),
    _Article(title: 'Nutrition Basics for Beginners', subtitle: 'Essential nutrients your body needs daily', category: 'Nutrition', author: 'Dr. Emily Parker', readingTime: '5 min'),
    _Article(title: 'Home Workout Routines', subtitle: 'Stay fit without going to the gym', category: 'Fitness', author: 'James Anderson', readingTime: '6 min'),
    _Article(title: 'Managing Anxiety Naturally', subtitle: ' techniques for stress relief and mental wellness', category: 'Mental Health', author: 'Dr. Lisa Thompson', readingTime: '7 min'),
    _Article(title: 'Women\'s Health at Every Age', subtitle: 'What you need to know about preventive care', category: "Women's Health", author: 'Dr. Lisa Thompson', readingTime: '10 min'),
    _Article(title: 'Sleep Better Tonight', subtitle: 'Tips for improving your sleep quality', category: 'Disease Prevention', author: 'Dr. Emily Parker', readingTime: '4 min'),
  ];

  final List<String> _categories = ['All', 'Disease Prevention', 'Nutrition', 'Fitness', 'Mental Health', "Women's Health", "Men's Health", 'Senior Care', 'First Aid'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      drawer: _buildDrawer(),
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width > 800)
            GlassSidebar(
              selectedIndex: 9,
              onItemTap: (_) {},
              onThemeToggle: () => setState(() => _isDark = !_isDark),
              currentTheme: _isDark ? AppThemeMode.dark : AppThemeMode.light,
              isDark: _isDark,
            ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                _buildAppBar(),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFeaturedArticle(),
                        const SizedBox(height: 24),
                        _buildCategories(),
                        const SizedBox(height: 24),
                        _buildArticlesGrid(),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GlassBottomNav(
        currentIndex: 0,
        onTap: (_) {},
        items: const [
          GlassBottomNavItem(icon: Icons.home_outlined, activeIcon: Icons.home, label: 'Home'),
          GlassBottomNavItem(icon: Icons.medical_services_outlined, activeIcon: Icons.medical_services, label: 'Doctors'),
          GlassBottomNavItem(icon: Icons.calendar_today_outlined, activeIcon: Icons.calendar_today, label: 'Appointments'),
          GlassBottomNavItem(icon: Icons.person_outline, activeIcon: Icons.person, label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return GlassDrawer(
      selectedIndex: 9,
      onItemTap: (_) {},
      onThemeToggle: () => setState(() => _isDark = !_isDark),
      currentTheme: _isDark ? AppThemeMode.dark : AppThemeMode.light,
      isDark: _isDark,
      child: const SizedBox(),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      floating: true,
      backgroundColor: _isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.menu, color: _isDark ? Colors.white : AppColors.textPrimaryLight),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: Text('Health Library', style: TextStyle(color: _isDark ? Colors.white : AppColors.textPrimaryLight, fontWeight: FontWeight.bold)),
      actions: [
        IconButton(icon: Icon(Icons.search, color: _isDark ? Colors.white : AppColors.textPrimaryLight), onPressed: () {}),
        GlassThemeToggle(
          currentTheme: _isDark ? AppThemeMode.dark : AppThemeMode.light,
          onChanged: (mode) => setState(() => _isDark = mode == AppThemeMode.dark),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildFeaturedArticle() {
    final featured = _articles.firstWhere((a) => a.isFeatured, orElse: () => _articles.first);

    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [AppColors.primaryBlue, AppColors.teal], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: AppColors.primaryBlue.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10))],
        ),
        child: Stack(
          children: [
            Positioned(right: -40, top: -40, child: Container(width: 200, height: 200, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.1)))),
            Positioned(left: -30, bottom: -30, child: Container(width: 150, height: 150, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.1)))),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, color: Colors.white, size: 16),
                            SizedBox(width: 4),
                            Text('Featured', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(featured.title, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold), maxLines: 2),
                  const SizedBox(height: 8),
                  Text(featured.subtitle, style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14), maxLines: 2),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      CircleAvatar(radius: 14, backgroundColor: Colors.white.withOpacity(0.3), child: Text(featured.author[0], style: const TextStyle(color: Colors.white, fontSize: 12))),
                      const SizedBox(width: 8),
                      Text(featured.author, style: const TextStyle(color: Colors.white, fontSize: 12)),
                      const Spacer(),
                      const Icon(Icons.access_time, color: Colors.white70, size: 14),
                      const SizedBox(width: 4),
                      Text(featured.readingTime, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.1, end: 0);
  }

  Widget _buildCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _isDark ? Colors.white : AppColors.textPrimaryLight)),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _categories.asMap().entries.map((entry) {
              final index = entry.key;
              final category = entry.value;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GlassChip(
                  label: category,
                  isSelected: _selectedCategory == index,
                  onTap: () => setState(() => _selectedCategory = index),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    ).animate().fadeIn(delay: 100.ms, duration: 400.ms);
  }

  Widget _buildArticlesGrid() {
    final filteredArticles = _selectedCategory == 0
        ? _articles.where((a) => !a.isFeatured).toList()
        : _articles.where((a) => a.category == _categories[_selectedCategory] && !a.isFeatured).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Trending Articles', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _isDark ? Colors.white : AppColors.textPrimaryLight)),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8, crossAxisSpacing: 12, mainAxisSpacing: 12),
          itemCount: filteredArticles.length,
          itemBuilder: (context, index) {
            final article = filteredArticles[index];
            return _ArticleCard(article: article, isDark: _isDark, isBookmarked: _bookmarkedArticles.contains(article.title), onBookmark: () {
              setState(() {
                if (_bookmarkedArticles.contains(article.title)) {
                  _bookmarkedArticles.remove(article.title);
                } else {
                  _bookmarkedArticles.add(article.title);
                }
              });
            });
          },
        ),
      ],
    ).animate().fadeIn(delay: 200.ms, duration: 400.ms);
  }
}

class _Article {
  final String title;
  final String subtitle;
  final String category;
  final String author;
  final String readingTime;
  final bool isFeatured;

  _Article({required this.title, required this.subtitle, required this.category, required this.author, required this.readingTime, this.isFeatured = false});
}

class _ArticleCard extends StatelessWidget {
  final _Article article;
  final bool isDark;
  final bool isBookmarked;
  final VoidCallback? onBookmark;

  const _ArticleCard({required this.article, required this.isDark, this.isBookmarked = false, this.onBookmark});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(12),
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [AppColors.primaryBlue, AppColors.teal]),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(Icons.article, color: Colors.white.withOpacity(0.5), size: 36),
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: GestureDetector(
                  onTap: onBookmark,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), shape: BoxShape.circle),
                    child: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border, color: AppColors.primaryBlue, size: 18),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: AppColors.primaryBlue.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
            child: Text(article.category, style: const TextStyle(fontSize: 10, color: AppColors.primaryBlue, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(height: 8),
          Text(article.title, style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppColors.textPrimaryLight), maxLines: 2, overflow: TextOverflow.ellipsis),
          const Spacer(),
          Row(
            children: [
              Icon(Icons.access_time, size: 12, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
              const SizedBox(width: 4),
              Text(article.readingTime, style: TextStyle(fontSize: 11, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
            ],
          ),
        ],
      ),
    );
  }
}
