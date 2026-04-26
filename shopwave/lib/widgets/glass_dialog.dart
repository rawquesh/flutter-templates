import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class GlassDialog extends StatelessWidget {
  final String? title;
  final Widget content;
  final List<Widget>? actions;
  final double borderRadius;

  const GlassDialog({
    super.key,
    this.title,
    required this.content,
    this.actions,
    this.borderRadius = 24,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    String? title,
    required Widget content,
    List<Widget>? actions,
    double borderRadius = 24,
    bool barrierDismissible = true,
  }) {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: 'Dismiss',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return GlassDialog(
          title: title,
          content: content,
          actions: actions,
          borderRadius: borderRadius,
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack,
          ),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.black.withValues(alpha: 0.7)
                    : Colors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.1)
                      : Colors.white,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 30,
                    offset: const Offset(0, 15),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                      child: Text(
                        title!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: content,
                  ),
                  if (actions != null && actions!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: actions!
                            .map((action) => Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: action,
                                ))
                            .toList(),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GlassConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final Color? confirmColor;

  const GlassConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmText = 'Confirm',
    this.cancelText = 'Cancel',
    this.onConfirm,
    this.onCancel,
    this.confirmColor,
  });

  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    Color? confirmColor,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => GlassConfirmDialog(
        title: title,
        message: message,
        confirmText: confirmText,
        cancelText: cancelText,
        confirmColor: confirmColor,
        onConfirm: () => Navigator.of(context).pop(true),
        onCancel: () => Navigator.of(context).pop(false),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GlassDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: (confirmColor ?? AppColors.primaryBlue)
                  .withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.help_outline,
              size: 48,
              color: confirmColor ?? AppColors.primaryBlue,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            message,
            style: TextStyle(
              fontSize: 16,
              color: isDark
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: Text(
            cancelText,
            style: TextStyle(
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: onConfirm,
          style: ElevatedButton.styleFrom(
            backgroundColor: confirmColor ?? AppColors.primaryBlue,
          ),
          child: Text(confirmText),
        ),
      ],
    );
  }
}
