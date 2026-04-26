import 'dart:ui';
import 'package:flutter/material.dart';

class GlassTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final bool obscureText;
  final bool enabled;
  final int maxLines;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FocusNode? focusNode;
  final bool autofocus;

  const GlassTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.obscureText = false,
    this.enabled = true,
    this.maxLines = 1,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark
        ? Colors.white.withValues(alpha: 0.05)
        : Colors.white.withValues(alpha: 0.8);
    final borderColor = isDark
        ? Colors.white.withValues(alpha: 0.1)
        : Colors.grey.withValues(alpha: 0.3);
    final focusedBorderColor = Theme.of(context).primaryColor;
    final textColor = isDark ? Colors.white : Colors.black87;
    final hintColor = isDark ? Colors.white54 : Colors.grey;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          enabled: enabled,
          maxLines: maxLines,
          keyboardType: keyboardType,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          focusNode: focusNode,
          autofocus: autofocus,
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: hintColor),
            labelText: labelText,
            filled: true,
            fillColor: bgColor,
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, color: hintColor)
                : null,
            suffixIcon: suffixIcon != null
                ? IconButton(
                    icon: Icon(suffixIcon, color: hintColor),
                    onPressed: onSuffixTap,
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: focusedBorderColor, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class GlassSearchField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final VoidCallback? onTap;
  final bool readOnly;
  final ValueChanged<String>? onChanged;

  const GlassSearchField({
    super.key,
    this.controller,
    this.hintText = 'Search products...',
    this.onTap,
    this.readOnly = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark
        ? Colors.white.withValues(alpha: 0.1)
        : Colors.grey.withValues(alpha: 0.1);
    final iconColor = isDark ? Colors.white70 : Colors.grey;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: iconColor),
            const SizedBox(width: 12),
            Expanded(
              child: readOnly
                  ? Text(
                      hintText ?? 'Search products...',
                      style: TextStyle(
                        color: iconColor,
                        fontSize: 16,
                      ),
                    )
                  : TextField(
                      controller: controller,
                      readOnly: readOnly,
                      onChanged: onChanged,
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black87,
                      ),
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: TextStyle(color: iconColor),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
