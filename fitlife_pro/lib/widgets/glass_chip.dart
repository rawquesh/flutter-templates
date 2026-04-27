import 'package:flutter/material.dart';
import '../theme/colors.dart';

class GlassChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final IconData? icon;
  final Color? selectedColor;

  const GlassChip({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onTap,
    this.icon,
    this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final activeColor = selectedColor ?? AppColors.primaryOrange;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? activeColor.withValues(alpha: 0.15)
              : (isDark
                  ? Colors.white.withValues(alpha: 0.1)
                  : Colors.white.withValues(alpha: 0.8)),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? activeColor
                : (isDark ? Colors.white24 : Colors.grey.shade300),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 16,
                color: isSelected
                    ? activeColor
                    : (isDark ? Colors.white70 : Colors.grey),
              ),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? activeColor
                    : (isDark ? Colors.white70 : Colors.grey),
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GlassChipGroup extends StatelessWidget {
  final List<String> options;
  final int? selectedIndex;
  final ValueChanged<int>? onSelected;
  final bool scrollable;
  final List<IconData>? icons;

  const GlassChipGroup({
    super.key,
    required this.options,
    this.selectedIndex,
    this.onSelected,
    this.scrollable = false,
    this.icons,
  });

  @override
  Widget build(BuildContext context) {
    final children = List.generate(
      options.length,
      (index) => GlassChip(
        label: options[index],
        isSelected: selectedIndex == index,
        onTap: () => onSelected?.call(index),
        icon: icons != null && index < icons!.length ? icons![index] : null,
      ),
    );

    if (scrollable) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: children
              .map((chip) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: chip,
                  ))
              .toList(),
        ),
      );
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: children,
    );
  }
}

class FilterChipGroup extends StatelessWidget {
  final List<FilterChipOption> options;
  final Set<int> selectedIndices;
  final ValueChanged<Set<int>>? onSelectionChanged;
  final bool multiSelect;

  const FilterChipGroup({
    super.key,
    required this.options,
    this.selectedIndices = const {},
    this.onSelectionChanged,
    this.multiSelect = true,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(
        options.length,
        (index) => GlassChip(
          label: options[index].label,
          icon: options[index].icon,
          isSelected: selectedIndices.contains(index),
          onTap: () {
            final newSelection = Set<int>.from(selectedIndices);
            if (multiSelect) {
              if (newSelection.contains(index)) {
                newSelection.remove(index);
              } else {
                newSelection.add(index);
              }
            } else {
              newSelection.clear();
              newSelection.add(index);
            }
            onSelectionChanged?.call(newSelection);
          },
        ),
      ),
    );
  }
}

class FilterChipOption {
  final String label;
  final IconData? icon;

  const FilterChipOption({
    required this.label,
    this.icon,
  });
}
