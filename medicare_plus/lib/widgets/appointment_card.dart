
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/constants.dart';
import 'glass_card.dart';
import 'glass_button.dart';
import 'glass_avatar.dart';
import 'glass_badge.dart';

enum AppointmentStatus { upcoming, completed, cancelled, pending }

class AppointmentCard extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String? doctorImageUrl;
  final DateTime dateTime;
  final String location;
  final AppointmentStatus status;
  final VoidCallback? onReschedule;
  final VoidCallback? onCancel;
  final VoidCallback? onJoinCall;
  final bool isDark;

  const AppointmentCard({
    super.key,
    required this.doctorName,
    required this.specialty,
    this.doctorImageUrl,
    required this.dateTime,
    required this.location,
    this.status = AppointmentStatus.upcoming,
    this.onReschedule,
    this.onCancel,
    this.onJoinCall,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GlassAvatar(
                size: 50,
                name: doctorName,
                imageUrl: doctorImageUrl,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. $doctorName',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      specialty,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ],
                ),
              ),
              GlassBadge(
                label: _getStatusLabel(),
                type: _getStatusType(),
                isSmall: true,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.white.withOpacity(0.05)
                  : AppColors.backgroundLight,
              borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
            ),
            child: Row(
              children: [
                _InfoItem(
                  icon: Icons.calendar_today,
                  label: _formatDate(dateTime),
                  isDark: isDark,
                ),
                const SizedBox(width: 24),
                _InfoItem(
                  icon: Icons.access_time,
                  label: _formatTime(dateTime),
                  isDark: isDark,
                ),
                const SizedBox(width: 24),
                _InfoItem(
                  icon: Icons.location_on_outlined,
                  label: location,
                  isDark: isDark,
                ),
              ],
            ),
          ),
          if (status == AppointmentStatus.upcoming || status == AppointmentStatus.pending) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                if (onJoinCall != null)
                  Expanded(
                    child: GlassButton(
                      text: 'Join Call',
                      variant: GlassButtonVariant.primary,
                      icon: Icons.videocam,
                      height: 40,
                      onPressed: onJoinCall,
                    ),
                  ),
                if (onJoinCall != null && (onReschedule != null || onCancel != null))
                  const SizedBox(width: 12),
                if (onReschedule != null)
                  Expanded(
                    child: GlassButton(
                      text: 'Reschedule',
                      variant: GlassButtonVariant.secondary,
                      height: 40,
                      onPressed: onReschedule,
                    ),
                  ),
                if (onCancel != null) ...[
                  const SizedBox(width: 12),
                  GlassIconButton(
                    icon: Icons.close,
                    size: 40,
                    onPressed: onCancel,
                  ),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }

  String _getStatusLabel() {
    switch (status) {
      case AppointmentStatus.upcoming:
        return 'Upcoming';
      case AppointmentStatus.completed:
        return 'Completed';
      case AppointmentStatus.cancelled:
        return 'Cancelled';
      case AppointmentStatus.pending:
        return 'Pending';
    }
  }

  GlassBadgeType _getStatusType() {
    switch (status) {
      case AppointmentStatus.upcoming:
        return GlassBadgeType.info;
      case AppointmentStatus.completed:
        return GlassBadgeType.success;
      case AppointmentStatus.cancelled:
        return GlassBadgeType.error;
      case AppointmentStatus.pending:
        return GlassBadgeType.warning;
    }
  }

  String _formatDate(DateTime dt) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
  }

  String _formatTime(DateTime dt) {
    final hour = dt.hour > 12 ? dt.hour - 12 : (dt.hour == 0 ? 12 : dt.hour);
    final period = dt.hour >= 12 ? 'PM' : 'AM';
    return '${hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')} $period';
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isDark;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 16,
          color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
        ),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class AppointmentCardCompact extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final DateTime dateTime;
  final AppointmentStatus status;
  final VoidCallback? onTap;
  final bool isDark;

  const AppointmentCardCompact({
    super.key,
    required this.doctorName,
    required this.specialty,
    required this.dateTime,
    this.status = AppointmentStatus.upcoming,
    this.onTap,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDark
              ? Colors.white.withOpacity(0.05)
              : Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          border: Border.all(
            color: isDark
                ? Colors.white.withOpacity(0.1)
                : AppColors.dividerLight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                GlassAvatar(
                  size: 40,
                  name: doctorName,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. $doctorName',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        specialty,
                        style: theme.textTheme.labelSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 14,
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
                const SizedBox(width: 4),
                Text(
                  '${dateTime.day}/${dateTime.month}',
                  style: theme.textTheme.labelSmall,
                ),
                const Spacer(),
                Icon(
                  Icons.access_time,
                  size: 14,
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
                const SizedBox(width: 4),
                Text(
                  '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}',
                  style: theme.textTheme.labelSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
