import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/constants.dart';

class GlassTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int maxLines;
  final bool enabled;
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
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
    this.enabled = true,
    this.focusNode,
    this.autofocus = false,
  });

  @override
  State<GlassTextField> createState() => _GlassTextFieldState();
}

class _GlassTextFieldState extends State<GlassTextField> {
  late bool _obscureText;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.labelText != null) ...[
          Text(
            widget.labelText!,
            style: theme.textTheme.labelMedium?.copyWith(
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
          const SizedBox(height: 8),
        ],
        ClipRRect(
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AnimatedContainer(
              duration: AppConstants.animationMedium,
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.white.withOpacity(0.08)
                    : Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                border: Border.all(
                  color: _isFocused
                      ? AppColors.primaryBlue
                      : (isDark
                          ? Colors.white.withOpacity(0.1)
                          : AppColors.dividerLight),
                  width: _isFocused ? 2 : 1,
                ),
                boxShadow: _isFocused
                    ? [
                        BoxShadow(
                          color: AppColors.primaryBlue.withOpacity(0.1),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: TextFormField(
                controller: widget.controller,
                focusNode: _focusNode,
                obscureText: _obscureText,
                keyboardType: widget.keyboardType,
                validator: widget.validator,
                onChanged: widget.onChanged,
                maxLines: widget.maxLines,
                enabled: widget.enabled,
                autofocus: widget.autofocus,
                style: TextStyle(
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                  prefixIcon: widget.prefixIcon != null
                      ? Icon(
                          widget.prefixIcon,
                          color: _isFocused
                              ? AppColors.primaryBlue
                              : (isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight),
                        )
                      : null,
                  suffixIcon: widget.suffixIcon != null || widget.obscureText
                      ? IconButton(
                          icon: Icon(
                            widget.obscureText
                                ? (_obscureText
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined)
                                : widget.suffixIcon,
                            color: isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight,
                          ),
                          onPressed: widget.obscureText
                              ? () => setState(() => _obscureText = !_obscureText)
                              : widget.onSuffixTap,
                        )
                      : null,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class GlassSearchField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;
  final void Function()? onSubmitted;

  const GlassSearchField({
    super.key,
    this.controller,
    this.hintText = 'Search...',
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: isDark
                ? Colors.white.withOpacity(0.08)
                : Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
            border: Border.all(
              color: isDark
                  ? Colors.white.withOpacity(0.1)
                  : AppColors.dividerLight,
            ),
          ),
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            onTap: onTap,
            readOnly: readOnly,
            onSubmitted: (_) => onSubmitted?.call(),
            style: TextStyle(
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
