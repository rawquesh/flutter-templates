import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class GiftCardDesign extends StatelessWidget {
  final String amount;
  final String? message;
  final String? recipientName;
  final GiftCardTheme theme;
  final double width;
  final double height;

  const GiftCardDesign({
    super.key,
    required this.amount,
    this.message,
    this.recipientName,
    this.theme = GiftCardTheme.classic,
    this.width = 300,
    this.height = 180,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: _getGradient(),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.3),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: _getPrimaryColor().withValues(alpha: 0.3),
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
                  Icons.card_giftcard,
                  size: 120,
                  color: Colors.white.withValues(alpha: 0.1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.card_giftcard,
                                color: Colors.white,
                                size: 16,
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                'Gift Card',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        _getThemeIcon(),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$$amount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        if (recipientName != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            'To: $recipientName',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.8),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ],
                    ),
                    if (message != null)
                      Text(
                        message!,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 11,
                          fontStyle: FontStyle.italic,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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

  LinearGradient _getGradient() {
    switch (theme) {
      case GiftCardTheme.classic:
        return LinearGradient(
          colors: [
            AppColors.primaryBlue,
            AppColors.primaryBlueLight,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case GiftCardTheme.birthday:
        return LinearGradient(
          colors: [
            AppColors.accentCoral,
            const Color(0xFFFF8E53),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case GiftCardTheme.anniversary:
        return LinearGradient(
          colors: [
            const Color(0xFFEC4899),
            const Color(0xFF9333EA),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case GiftCardTheme.holiday:
        return LinearGradient(
          colors: [
            const Color(0xFF16A34A),
            const Color(0xFF22C55E),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case GiftCardTheme.thankYou:
        return LinearGradient(
          colors: [
            const Color(0xFFF59E0B),
            const Color(0xFFFBBF24),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
    }
  }

  Color _getPrimaryColor() {
    switch (theme) {
      case GiftCardTheme.classic:
        return AppColors.primaryBlue;
      case GiftCardTheme.birthday:
        return AppColors.accentCoral;
      case GiftCardTheme.anniversary:
        return const Color(0xFFEC4899);
      case GiftCardTheme.holiday:
        return const Color(0xFF16A34A);
      case GiftCardTheme.thankYou:
        return const Color(0xFFF59E0B);
    }
  }

  Widget _getThemeIcon() {
    IconData icon;
    switch (theme) {
      case GiftCardTheme.classic:
        icon = Icons.star;
        break;
      case GiftCardTheme.birthday:
        icon = Icons.cake;
        break;
      case GiftCardTheme.anniversary:
        icon = Icons.favorite;
        break;
      case GiftCardTheme.holiday:
        icon = Icons.park;
        break;
      case GiftCardTheme.thankYou:
        icon = Icons.thumb_up;
        break;
    }

    return Icon(
      icon,
      color: Colors.white.withValues(alpha: 0.6),
      size: 24,
    );
  }
}

enum GiftCardTheme {
  classic,
  birthday,
  anniversary,
  holiday,
  thankYou,
}

class GiftCardSelector extends StatelessWidget {
  final GiftCardTheme selectedTheme;
  final ValueChanged<GiftCardTheme> onThemeSelected;

  const GiftCardSelector({
    super.key,
    required this.selectedTheme,
    required this.onThemeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: GiftCardTheme.values.map((theme) {
          final isSelected = theme == selectedTheme;
          return GestureDetector(
            onTap: () => onThemeSelected(theme),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected
                    ? _getThemeColor(theme)
                    : _getThemeColor(theme).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected
                      ? _getThemeColor(theme)
                      : _getThemeColor(theme).withValues(alpha: 0.3),
                  width: 2,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _getThemeIcon(theme),
                    color: isSelected ? Colors.white : _getThemeColor(theme),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _getThemeName(theme),
                    style: TextStyle(
                      color: isSelected ? Colors.white : _getThemeColor(theme),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Color _getThemeColor(GiftCardTheme theme) {
    switch (theme) {
      case GiftCardTheme.classic:
        return AppColors.primaryBlue;
      case GiftCardTheme.birthday:
        return AppColors.accentCoral;
      case GiftCardTheme.anniversary:
        return const Color(0xFFEC4899);
      case GiftCardTheme.holiday:
        return const Color(0xFF16A34A);
      case GiftCardTheme.thankYou:
        return const Color(0xFFF59E0B);
    }
  }

  IconData _getThemeIcon(GiftCardTheme theme) {
    switch (theme) {
      case GiftCardTheme.classic:
        return Icons.star;
      case GiftCardTheme.birthday:
        return Icons.cake;
      case GiftCardTheme.anniversary:
        return Icons.favorite;
      case GiftCardTheme.holiday:
        return Icons.park;
      case GiftCardTheme.thankYou:
        return Icons.thumb_up;
    }
  }

  String _getThemeName(GiftCardTheme theme) {
    switch (theme) {
      case GiftCardTheme.classic:
        return 'Classic';
      case GiftCardTheme.birthday:
        return 'Birthday';
      case GiftCardTheme.anniversary:
        return 'Anniversary';
      case GiftCardTheme.holiday:
        return 'Holiday';
      case GiftCardTheme.thankYou:
        return 'Thank You';
    }
  }
}
