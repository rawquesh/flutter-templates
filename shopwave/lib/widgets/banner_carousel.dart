import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class BannerCarousel extends StatefulWidget {
  final List<BannerItem> banners;
  final double height;
  final Duration autoScrollDuration;
  final ValueChanged<int>? onPageChanged;

  const BannerCarousel({
    super.key,
    required this.banners,
    this.height = 200,
    this.autoScrollDuration = const Duration(seconds: 4),
    this.onPageChanged,
  });

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.92);
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    Future.delayed(widget.autoScrollDuration, () {
      if (mounted) {
        _currentPage = (_currentPage + 1) % widget.banners.length;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        _startAutoScroll();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (page) {
              setState(() => _currentPage = page);
              widget.onPageChanged?.call(page);
            },
            itemCount: widget.banners.length,
            itemBuilder: (context, index) {
              return _BannerCard(
                banner: widget.banners[index],
                height: widget.height,
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        _DotIndicator(
          currentPage: _currentPage,
          totalPages: widget.banners.length,
        ),
      ],
    );
  }
}

class _BannerCard extends StatelessWidget {
  final BannerItem banner;
  final double height;

  const _BannerCard({
    required this.banner,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: banner.gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.2),
              ),
              boxShadow: [
                BoxShadow(
                  color: banner.gradientColors.first.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -20,
                  bottom: -20,
                  child: Icon(
                    banner.icon,
                    size: 150,
                    color: Colors.white.withValues(alpha: 0.1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        banner.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        banner.subtitle,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          banner.buttonText,
                          style: TextStyle(
                            color: banner.gradientColors.first,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DotIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const _DotIndicator({
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        final isActive = index == currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.primaryBlue
                : Colors.grey.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

class BannerItem {
  final String title;
  final String subtitle;
  final String buttonText;
  final IconData icon;
  final List<Color> gradientColors;

  const BannerItem({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.icon,
    required this.gradientColors,
  });
}

final List<BannerItem> defaultBanners = [
  BannerItem(
    title: 'New Collection',
    subtitle: 'Discover the latest trends',
    buttonText: 'Shop Now',
    icon: Icons.shopping_bag,
    gradientColors: [
      AppColors.primaryBlue,
      AppColors.primaryBlueLight,
    ],
  ),
  BannerItem(
    title: 'Summer Sale',
    subtitle: 'Up to 50% off',
    buttonText: 'Explore Deals',
    icon: Icons.local_offer,
    gradientColors: [
      AppColors.accentCoral,
      const Color(0xFFFF8E53),
    ],
  ),
  BannerItem(
    title: 'Flash Deals',
    subtitle: 'Limited time offers',
    buttonText: 'Catch Now',
    icon: Icons.bolt,
    gradientColors: [
      const Color(0xFF7C3AED),
      const Color(0xFF9333EA),
    ],
  ),
  BannerItem(
    title: 'Free Shipping',
    subtitle: 'On orders over \$50',
    buttonText: 'Learn More',
    icon: Icons.local_shipping,
    gradientColors: [
      AppColors.success,
      const Color(0xFF16A34A),
    ],
  ),
];
