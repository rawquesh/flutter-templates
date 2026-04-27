import 'package:flutter/material.dart';
import '../theme/colors.dart';

class GlassAvatar extends StatelessWidget {
  final String? imageUrl;
  final double size;
  final String? placeholderText;
  final VoidCallback? onTap;
  final bool showBorder;
  final Color? borderColor;
  final bool showLevelRing;
  final int? level;

  const GlassAvatar({
    super.key,
    this.imageUrl,
    this.size = 60,
    this.placeholderText,
    this.onTap,
    this.showBorder = true,
    this.borderColor,
    this.showLevelRing = false,
    this.level,
  });

  @override
  Widget build(BuildContext context) {
    Widget avatar = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            AppColors.primaryOrange.withValues(alpha: 0.3),
            AppColors.primaryRedOrange.withValues(alpha: 0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: showBorder
            ? Border.all(
                color: borderColor ?? Colors.white.withValues(alpha: 0.3),
                width: 2,
              )
            : null,
      ),
      child: ClipOval(
        child: imageUrl != null
            ? Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, exception, stackTrace) => _buildPlaceholder(),
              )
            : _buildPlaceholder(),
      ),
    );

    if (showLevelRing && level != null) {
      avatar = Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size + 8,
            height: size + 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryGradient,
            ),
          ),
          Container(
            width: size + 4,
            height: size + 4,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          avatar,
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.primaryOrange,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.5),
              ),
              child: Text(
                '$level',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      );
    }

    if (onTap != null) {
      avatar = GestureDetector(
        onTap: onTap,
        child: avatar,
      );
    }

    return avatar;
  }

  Widget _buildPlaceholder() {
    if (placeholderText != null && placeholderText!.isNotEmpty) {
      return Center(
        child: Text(
          placeholderText!.substring(0, 1).toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: size / 2.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
    return Icon(
      Icons.person,
      color: Colors.white.withValues(alpha: 0.7),
      size: size / 2,
    );
  }
}

class GlassAvatarGroup extends StatelessWidget {
  final List<String> imageUrls;
  final double avatarSize;
  final int maxDisplay;
  final double overlap;

  const GlassAvatarGroup({
    super.key,
    required this.imageUrls,
    this.avatarSize = 40,
    this.maxDisplay = 4,
    this.overlap = 10,
  });

  @override
  Widget build(BuildContext context) {
    final displayCount = imageUrls.length > maxDisplay ? maxDisplay : imageUrls.length;
    final extraCount = imageUrls.length - maxDisplay;

    return SizedBox(
      height: avatarSize,
      width: avatarSize + (displayCount - 1) * (avatarSize - overlap) + (extraCount > 0 ? avatarSize - overlap : 0),
      child: Stack(
        children: [
          ...List.generate(
            displayCount,
            (index) => Positioned(
              left: index * (avatarSize - overlap),
              child: GlassAvatar(
                imageUrl: imageUrls[index],
                size: avatarSize,
                showBorder: false,
              ),
            ),
          ),
          if (extraCount > 0)
            Positioned(
              left: displayCount * (avatarSize - overlap),
              child: Container(
                width: avatarSize,
                height: avatarSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryOrange.withValues(alpha: 0.2),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.5),
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    '+$extraCount',
                    style: const TextStyle(
                      color: AppColors.primaryOrange,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
