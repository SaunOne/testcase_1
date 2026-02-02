import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// AppAvatar - Consistent avatar widget
///
/// Usage:
/// ```dart
/// AppAvatar(imageUrl: 'https://...')
///
/// AppAvatar.initials('John Doe')
///
/// AppAvatar.icon(Icons.person)
/// ```
class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    this.imageUrl,
    this.size = AppSizes.avatarMd,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.onTap,
    this.placeholder,
    this.errorWidget,
  });

  /// Avatar with initials
  factory AppAvatar.initials(
    String name, {
    Key? key,
    double size = AppSizes.avatarMd,
    Color? backgroundColor,
    Color? textColor,
    VoidCallback? onTap,
  }) {
    return _AppAvatarInitials(
      name: name,
      key: key,
      size: size,
      backgroundColor: backgroundColor,
      textColor: textColor,
      onTap: onTap,
    );
  }

  /// Avatar with icon
  factory AppAvatar.icon(
    IconData icon, {
    Key? key,
    double size = AppSizes.avatarMd,
    Color? backgroundColor,
    Color? iconColor,
    VoidCallback? onTap,
  }) {
    return _AppAvatarIcon(
      icon: icon,
      key: key,
      size: size,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      onTap: onTap,
    );
  }

  final String? imageUrl;
  final double size;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final VoidCallback? onTap;
  final Widget? placeholder;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final effectiveBorderRadius =
        borderRadius ?? BorderRadius.circular(size / 2);

    Widget avatar = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? colors.surfaceAlt,
        borderRadius: effectiveBorderRadius,
        border: borderColor != null || borderWidth != null
            ? Border.all(
                color: borderColor ?? colors.border,
                width: borderWidth ?? AppSizes.border,
              )
            : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: imageUrl != null
          ? Image.network(
              imageUrl!,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return placeholder ?? _buildPlaceholder(context);
              },
              errorBuilder: (context, error, stackTrace) {
                return errorWidget ?? _buildPlaceholder(context);
              },
            )
          : placeholder ?? _buildPlaceholder(context),
    );

    if (onTap != null) {
      avatar = GestureDetector(onTap: onTap, child: avatar);
    }

    return avatar;
  }

  Widget _buildPlaceholder(BuildContext context) {
    final colors = context.colors;
    return Center(
      child: Icon(
        Icons.person_rounded,
        size: size * 0.5,
        color: colors.textSecondary,
      ),
    );
  }
}

class _AppAvatarInitials extends AppAvatar {
  const _AppAvatarInitials({
    required this.name,
    super.key,
    super.size,
    super.backgroundColor,
    this.textColor,
    super.onTap,
  });

  final String name;
  final Color? textColor;

  String get initials {
    final parts = name.trim().split(' ');
    if (parts.isEmpty) return '';
    if (parts.length == 1) return parts[0].substring(0, 1).toUpperCase();
    return '${parts[0].substring(0, 1)}${parts.last.substring(0, 1)}'
        .toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    Widget avatar = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? colors.primaryContainer,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          initials,
          style: AppTypography.button.copyWith(
            color: textColor ?? colors.onPrimaryContainer,
            fontSize: size * 0.35,
          ),
        ),
      ),
    );

    if (onTap != null) {
      avatar = GestureDetector(onTap: onTap, child: avatar);
    }

    return avatar;
  }
}

class _AppAvatarIcon extends AppAvatar {
  const _AppAvatarIcon({
    required this.icon,
    super.key,
    super.size,
    super.backgroundColor,
    this.iconColor,
    super.onTap,
  });

  final IconData icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    Widget avatar = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? colors.surfaceAlt,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          icon,
          size: size * 0.5,
          color: iconColor ?? colors.textSecondary,
        ),
      ),
    );

    if (onTap != null) {
      avatar = GestureDetector(onTap: onTap, child: avatar);
    }

    return avatar;
  }
}
