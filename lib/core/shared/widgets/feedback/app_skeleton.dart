import 'package:flutter/material.dart';
import 'package:testcase_1/core/shared/styles/tokens/index.dart';
import 'package:testcase_1/core/utils/extensions/context_theme_extension.dart';

/// AppSkeleton - Shimmer loading placeholder
///
/// Usage:
/// ```dart
/// AppSkeleton(width: 100, height: 20)
///
/// AppSkeleton.circle(size: 48)
///
/// AppSkeleton.text(lines: 3)
///
/// AppSkeleton.card()
/// ```
class AppSkeleton extends StatefulWidget {
  const AppSkeleton({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.margin,
  });

  /// Circle skeleton (for avatars)
  const factory AppSkeleton.circle({Key? key, double size}) =
      _AppSkeletonCircle;

  /// Text skeleton (multiple lines)
  const factory AppSkeleton.text({
    Key? key,
    int lines,
    double? lineHeight,
    double? spacing,
    double? lastLineWidth,
  }) = _AppSkeletonText;

  /// Card skeleton
  const factory AppSkeleton.card({
    Key? key,
    double? height,
    EdgeInsets? margin,
  }) = _AppSkeletonCard;

  /// List tile skeleton
  const factory AppSkeleton.listTile({
    Key? key,
    bool hasLeading,
    bool hasTrailing,
    int titleLines,
    int subtitleLines,
  }) = _AppSkeletonListTile;

  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final EdgeInsets? margin;

  @override
  State<AppSkeleton> createState() => _AppSkeletonState();
}

class _AppSkeletonState extends State<AppSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: AppMotion.shimmer)
      ..repeat();
    _animation = Tween<double>(
      begin: -1.0,
      end: 2.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isDark = context.isDarkMode;

    final baseColor = isDark ? colors.surfaceAlt : colors.divider;
    final highlightColor = isDark
        ? colors.surface.withValues(alpha: 0.5)
        : colors.surface;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height ?? 16,
          margin: widget.margin,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius ?? AppRadius.borderSm,
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [baseColor, highlightColor, baseColor],
              stops: [
                (_animation.value - 1).clamp(0.0, 1.0),
                _animation.value.clamp(0.0, 1.0),
                (_animation.value + 1).clamp(0.0, 1.0),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AppSkeletonCircle extends AppSkeleton {
  const _AppSkeletonCircle({super.key, this.size = 48});

  final double size;

  @override
  State<AppSkeleton> createState() => _AppSkeletonCircleState();
}

class _AppSkeletonCircleState extends _AppSkeletonState {
  @override
  Widget build(BuildContext context) {
    final circleWidget = widget as _AppSkeletonCircle;
    final colors = context.colors;
    final isDark = context.isDarkMode;

    final baseColor = isDark ? colors.surfaceAlt : colors.divider;
    final highlightColor = isDark
        ? colors.surface.withValues(alpha: 0.5)
        : colors.surface;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: circleWidget.size,
          height: circleWidget.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [baseColor, highlightColor, baseColor],
              stops: [
                (_animation.value - 1).clamp(0.0, 1.0),
                _animation.value.clamp(0.0, 1.0),
                (_animation.value + 1).clamp(0.0, 1.0),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AppSkeletonText extends AppSkeleton {
  const _AppSkeletonText({
    super.key,
    this.lines = 3,
    this.lineHeight,
    this.spacing,
    this.lastLineWidth,
  });

  final int lines;
  final double? lineHeight;
  final double? spacing;
  final double? lastLineWidth;

  @override
  State<AppSkeleton> createState() => _AppSkeletonTextState();
}

class _AppSkeletonTextState extends State<_AppSkeletonText> {
  @override
  Widget build(BuildContext context) {
    final textWidget = widget as _AppSkeletonText;
    final effectiveLineHeight = textWidget.lineHeight ?? 14.0;
    final effectiveSpacing = textWidget.spacing ?? AppSpacing.sm;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(textWidget.lines, (index) {
        final isLast = index == textWidget.lines - 1;
        return Padding(
          padding: EdgeInsets.only(bottom: isLast ? 0 : effectiveSpacing),
          child: FractionallySizedBox(
            widthFactor: isLast ? (textWidget.lastLineWidth ?? 0.7) : 1.0,
            child: AppSkeleton(height: effectiveLineHeight),
          ),
        );
      }),
    );
  }
}

class _AppSkeletonCard extends AppSkeleton {
  const _AppSkeletonCard({super.key, super.height = 120, super.margin});

  @override
  State<AppSkeleton> createState() => _AppSkeletonCardState();
}

class _AppSkeletonCardState extends _AppSkeletonState {
  @override
  Widget build(BuildContext context) {
    return AppSkeleton(
      width: double.infinity,
      height: widget.height,
      margin: widget.margin,
      borderRadius: AppRadius.borderCard,
    );
  }
}

class _AppSkeletonListTile extends AppSkeleton {
  const _AppSkeletonListTile({
    super.key,
    this.hasLeading = true,
    this.hasTrailing = false,
    this.titleLines = 1,
    this.subtitleLines = 1,
  });

  final bool hasLeading;
  final bool hasTrailing;
  final int titleLines;
  final int subtitleLines;

  @override
  State<AppSkeleton> createState() => _AppSkeletonListTileState();
}

class _AppSkeletonListTileState extends State<_AppSkeletonListTile> {
  @override
  Widget build(BuildContext context) {
    final tileWidget = widget as _AppSkeletonListTile;

    return Padding(
      padding: AppSpacing.listTilePadding,
      child: Row(
        children: [
          if (tileWidget.hasLeading) ...[
            const AppSkeleton.circle(size: 40),
            AppSpacing.widthMd,
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSkeleton(
                  width: double.infinity,
                  height: 16,
                  borderRadius: AppRadius.borderSm,
                ),
                if (tileWidget.subtitleLines > 0) ...[
                  AppSpacing.heightSm,
                  AppSkeleton(
                    width: 150,
                    height: 12,
                    borderRadius: AppRadius.borderSm,
                  ),
                ],
              ],
            ),
          ),
          if (tileWidget.hasTrailing) ...[
            AppSpacing.widthMd,
            AppSkeleton(
              width: 24,
              height: 24,
              borderRadius: AppRadius.borderSm,
            ),
          ],
        ],
      ),
    );
  }
}
