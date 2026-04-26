import 'package:flutter/material.dart';
import '../theme/colors.dart';

class GlassQuantitySelector extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onChanged;
  final int minQuantity;
  final int maxQuantity;

  const GlassQuantitySelector({
    super.key,
    required this.quantity,
    required this.onChanged,
    this.minQuantity = 1,
    this.maxQuantity = 99,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.1)
            : Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.grey.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _QuantityButton(
            icon: Icons.remove,
            onTap: quantity > minQuantity
                ? () => onChanged(quantity - 1)
                : null,
          ),
          Container(
            width: 40,
            alignment: Alignment.center,
            child: Text(
              '$quantity',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
            ),
          ),
          _QuantityButton(
            icon: Icons.add,
            onTap: quantity < maxQuantity
                ? () => onChanged(quantity + 1)
                : null,
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _QuantityButton({
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDisabled = onTap == null;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Icon(
          icon,
          size: 20,
          color: isDisabled
              ? (isDark ? Colors.white24 : Colors.grey)
              : AppColors.primaryBlue,
        ),
      ),
    );
  }
}

class GlassCounter extends StatelessWidget {
  final int count;
  final Color? backgroundColor;
  final Color? textColor;

  const GlassCounter({
    super.key,
    required this.count,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.accentCoral,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        count > 99 ? '99+' : '$count',
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
