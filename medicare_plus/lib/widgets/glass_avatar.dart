import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/constants.dart';

class GlassAvatar extends StatelessWidget {
  final double size;
  final String? imageUrl;
  final String? name;
  final Color? borderColor;
  final bool showBorder;
  final bool showGlow;
  final VoidCallback? onTap;

  const GlassAvatar({
    super.key,
    this.size = AppConstants.avatarMedium,
    this.imageUrl,
    this.name,
    this.borderColor,
    this.showBorder = true,
    this.showGlow = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: showGlow
              ? const LinearGradient(
                  colors: [AppColors.primaryBlue, AppColors.teal],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          boxShadow: showGlow
              ? [
                  BoxShadow(
                    color: AppColors.primaryBlue.withValues(alpha: 0.3),
                    blurRadius: 16,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        ),
        padding: showGlow ? const EdgeInsets.all(2) : null,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).scaffoldBackgroundColor,
            border: showBorder && !showGlow
                ? Border.all(
                    color: borderColor ?? AppColors.primaryBlue.withValues(alpha: 0.3),
                    width: 2,
                  )
                : null,
          ),
          child: ClipOval(
            child: _buildContent(context),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return Image.network(
        imageUrl!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildPlaceholder(context),
      );
    }

    return _buildPlaceholder(context);
  }

  Widget _buildPlaceholder(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (name != null && name!.isNotEmpty) {
      final initials = _getInitials(name!);
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryBlue,
              AppColors.teal,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            initials,
            style: TextStyle(
              color: Colors.white,
              fontSize: size * 0.4,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    return Container(
      color: isDark ? AppColors.cardDark : AppColors.backgroundLight,
      child: Icon(
        Icons.person,
        color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
        size: size * 0.6,
      ),
    );
  }

  String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }
}

class GlassAvatarGroup extends StatelessWidget {
  final List<GlassAvatarGroupItem> avatars;
  final double avatarSize;
  final int maxDisplay;
  final double overlap;

  const GlassAvatarGroup({
    super.key,
    required this.avatars,
    this.avatarSize = 40,
    this.maxDisplay = 3,
    this.overlap = 0.3,
  });

  @override
  Widget build(BuildContext context) {
    final displayCount = avatars.length > maxDisplay ? maxDisplay : avatars.length;
    final remaining = avatars.length - displayCount;

    return SizedBox(
      height: avatarSize,
      child: Stack(
        children: [
          for (int i = 0; i < displayCount; i++)
            Positioned(
              left: i * (avatarSize * (1 - overlap)),
              child: GlassAvatar(
                size: avatarSize,
                name: avatars[i].name,
                imageUrl: avatars[i].imageUrl,
                showGlow: i == 0,
              ),
            ),
          if (remaining > 0)
            Positioned(
              left: displayCount * (avatarSize * (1 - overlap)),
              child: Container(
                width: avatarSize,
                height: avatarSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryBlue,
                  border: Border.all(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    '+$remaining',
                    style: const TextStyle(
                      color: Colors.white,
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

class GlassAvatarGroupItem {
  final String? name;
  final String? imageUrl;

  const GlassAvatarGroupItem({
    this.name,
    this.imageUrl,
  });
}
