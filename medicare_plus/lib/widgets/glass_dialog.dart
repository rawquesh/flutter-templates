import 'dart:ui';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/constants.dart';
import 'glass_button.dart';

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
    this.borderRadius = AppConstants.radiusLarge,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.sidebarDark.withValues(alpha: 0.95)
                  : AppColors.cardLight.withValues(alpha: 0.95),
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.1)
                    : Colors.white.withValues(alpha: 0.3),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.5 : 0.2),
                  blurRadius: 30,
                  offset: const Offset(0, 20),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (title != null) ...[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            title!,
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.close,
                            color: isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.1)
                        : AppColors.dividerLight,
                  ),
                ],
                Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: content,
                  ),
                ),
                if (actions != null && actions!.isNotEmpty) ...[
                  Divider(
                    height: 1,
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.1)
                        : AppColors.dividerLight,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        for (int i = 0; i < actions!.length; i++) ...[
                          if (i > 0) const SizedBox(width: 12),
                          actions![i],
                        ],
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<T?> showGlassDialog<T>({
  required BuildContext context,
  String? title,
  required Widget content,
  List<Widget>? actions,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black54,
    builder: (context) => GlassDialog(
      title: title,
      content: content,
      actions: actions,
    ),
  );
}

class GlassConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final bool isDestructive;

  const GlassConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmText = 'Confirm',
    this.cancelText = 'Cancel',
    this.onConfirm,
    this.onCancel,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GlassDialog(
      title: title,
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: [
        GlassButton(
          text: cancelText,
          variant: GlassButtonVariant.secondary,
          onPressed: () {
            Navigator.pop(context);
            onCancel?.call();
          },
        ),
        GlassButton(
          text: confirmText,
          variant: isDestructive
              ? GlassButtonVariant.outline
              : GlassButtonVariant.primary,
          onPressed: () {
            Navigator.pop(context);
            onConfirm?.call();
          },
        ),
      ],
    );
  }
}

Future<bool?> showGlassConfirmDialog({
  required BuildContext context,
  required String title,
  required String message,
  String confirmText = 'Confirm',
  String cancelText = 'Cancel',
  bool isDestructive = false,
}) {
  return showGlassDialog<bool>(
    context: context,
    title: title,
    content: Text(
      message,
      style: Theme.of(context).textTheme.bodyMedium,
    ),
    actions: [
      GlassButton(
        text: cancelText,
        variant: GlassButtonVariant.secondary,
        onPressed: () => Navigator.pop(context, false),
      ),
      GlassButton(
        text: confirmText,
        variant: isDestructive
            ? GlassButtonVariant.outline
            : GlassButtonVariant.primary,
        onPressed: () => Navigator.pop(context, true),
      ),
    ],
  );
}
