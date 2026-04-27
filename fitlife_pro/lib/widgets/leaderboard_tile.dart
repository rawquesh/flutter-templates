import 'package:flutter/material.dart';
import '../theme/colors.dart';

class LeaderboardTile extends StatelessWidget {
  final int rank;
  final String name;
  final String? avatarUrl;
  final int score;
  final bool isCurrentUser;

  const LeaderboardTile({
    super.key,
    required this.rank,
    required this.name,
    this.avatarUrl,
    required this.score,
    this.isCurrentUser = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isCurrentUser
            ? AppColors.primaryOrange.withValues(alpha: 0.1)
            : (isDark
                ? Colors.white.withValues(alpha: 0.05)
                : Colors.white),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCurrentUser
              ? AppColors.primaryOrange.withValues(alpha: 0.3)
              : (isDark
                  ? Colors.white.withValues(alpha: 0.1)
                  : Colors.grey.shade200),
          width: isCurrentUser ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          _buildRankBadge(),
          const SizedBox(width: 12),
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.primaryOrange.withValues(alpha: 0.2),
            backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl!) : null,
            child: avatarUrl == null
                ? Text(
                    name.isNotEmpty ? name[0].toUpperCase() : '?',
                    style: const TextStyle(
                      color: AppColors.primaryOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                    fontSize: 14,
                    fontWeight: isCurrentUser ? FontWeight.bold : FontWeight.w500,
                  ),
                ),
                if (isCurrentUser)
                  Text(
                    'You',
                    style: TextStyle(
                      color: AppColors.primaryOrange,
                      fontSize: 10,
                    ),
                  ),
              ],
            ),
          ),
          Text(
            '$score pts',
            style: TextStyle(
              color: isDark ? Colors.white : const Color(0xFF1A1A2E),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRankBadge() {
    Color backgroundColor;
    Color textColor;
    IconData? icon;

    switch (rank) {
      case 1:
        backgroundColor = const Color(0xFFFFD700);
        textColor = Colors.black;
        icon = Icons.emoji_events;
        break;
      case 2:
        backgroundColor = const Color(0xFFC0C0C0);
        textColor = Colors.black;
        icon = Icons.emoji_events;
        break;
      case 3:
        backgroundColor = const Color(0xFFCD7F32);
        textColor = Colors.white;
        icon = Icons.emoji_events;
        break;
      default:
        backgroundColor = Colors.grey.withValues(alpha: 0.2);
        textColor = Colors.grey;
        icon = null;
    }

    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: icon != null
            ? Icon(icon, size: 18, color: textColor)
            : Text(
                '$rank',
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
