import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// SVG source type
enum SvgSourceType {
  /// Load from network URL
  network,

  /// Load from local asset
  asset,

  /// Load from raw SVG string
  string,

  /// Auto-detect based on content
  auto,
}

/// A unified SVG widget that handles network SVGs, assets, and raw strings
/// with loading states and error fallbacks.
///
/// Features:
/// - Network SVG loading
/// - Asset SVG loading
/// - Raw SVG string rendering
/// - Custom loading placeholder
/// - Custom error/fallback widget
/// - Color theming support
/// - Automatic source detection
///
/// Example usage:
/// ```dart
/// // Asset SVG
/// AppSvg.asset('assets/icons/home.svg')
///
/// // Network SVG
/// AppSvg.network('https://example.com/icon.svg')
///
/// // SVG string
/// AppSvg.string('<svg>...</svg>')
///
/// // With color theming
/// AppSvg.asset(
///   'assets/icons/heart.svg',
///   color: Colors.red,
/// )
/// ```
class AppSvg extends StatelessWidget {
  const AppSvg({
    required this.source,
    this.sourceType = SvgSourceType.auto,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.color,
    this.colorBlendMode = BlendMode.srcIn,
    this.semanticsLabel,
    this.excludeFromSemantics = false,
    this.fallbackWidget,
    this.fallbackIcon,
    this.loadingWidget,
    this.showLoadingIndicator = false,
    this.clipBehavior = Clip.hardEdge,
    this.theme,
    this.headers,
    super.key,
  });

  /// Create an AppSvg from asset path
  const AppSvg.asset(
    String assetPath, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Widget? fallbackWidget,
    IconData? fallbackIcon,
    Clip clipBehavior = Clip.hardEdge,
    SvgTheme? theme,
    Key? key,
  }) : this(
          source: assetPath,
          sourceType: SvgSourceType.asset,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
          color: color,
          colorBlendMode: colorBlendMode,
          semanticsLabel: semanticsLabel,
          excludeFromSemantics: excludeFromSemantics,
          fallbackWidget: fallbackWidget,
          fallbackIcon: fallbackIcon,
          clipBehavior: clipBehavior,
          theme: theme,
          key: key,
        );

  /// Create an AppSvg from network URL
  const AppSvg.network(
    String url, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Widget? fallbackWidget,
    IconData? fallbackIcon,
    Widget? loadingWidget,
    bool showLoadingIndicator = true,
    Clip clipBehavior = Clip.hardEdge,
    SvgTheme? theme,
    Map<String, String>? headers,
    Key? key,
  }) : this(
          source: url,
          sourceType: SvgSourceType.network,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
          color: color,
          colorBlendMode: colorBlendMode,
          semanticsLabel: semanticsLabel,
          excludeFromSemantics: excludeFromSemantics,
          fallbackWidget: fallbackWidget,
          fallbackIcon: fallbackIcon,
          loadingWidget: loadingWidget,
          showLoadingIndicator: showLoadingIndicator,
          clipBehavior: clipBehavior,
          theme: theme,
          headers: headers,
          key: key,
        );

  /// Create an AppSvg from raw SVG string
  const AppSvg.string(
    String svgString, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Widget? fallbackWidget,
    IconData? fallbackIcon,
    Clip clipBehavior = Clip.hardEdge,
    SvgTheme? theme,
    Key? key,
  }) : this(
          source: svgString,
          sourceType: SvgSourceType.string,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
          color: color,
          colorBlendMode: colorBlendMode,
          semanticsLabel: semanticsLabel,
          excludeFromSemantics: excludeFromSemantics,
          fallbackWidget: fallbackWidget,
          fallbackIcon: fallbackIcon,
          clipBehavior: clipBehavior,
          theme: theme,
          key: key,
        );

  /// The SVG source (URL, asset path, or raw SVG string)
  final String source;

  /// Source type (network, asset, string, or auto-detect)
  final SvgSourceType sourceType;

  /// Width of the SVG
  final double? width;

  /// Height of the SVG
  final double? height;

  /// How the SVG should be inscribed into the space
  final BoxFit fit;

  /// Alignment of the SVG within its bounds
  final Alignment alignment;

  /// Color to apply to the SVG (replaces all colors in the SVG)
  final Color? color;

  /// Blend mode for the color
  final BlendMode colorBlendMode;

  /// Semantic label for accessibility
  final String? semanticsLabel;

  /// Whether to exclude from semantics tree
  final bool excludeFromSemantics;

  /// Custom fallback widget when SVG fails to load
  final Widget? fallbackWidget;

  /// Fallback icon when SVG fails to load (used if fallbackWidget is null)
  final IconData? fallbackIcon;

  /// Custom loading widget for network SVGs
  final Widget? loadingWidget;

  /// Whether to show loading indicator for network SVGs
  final bool showLoadingIndicator;

  /// Clip behavior for the SVG
  final Clip clipBehavior;

  /// Theme for the SVG (font size, colors, etc.)
  final SvgTheme? theme;

  /// HTTP headers for network requests
  final Map<String, String>? headers;

  SvgSourceType get _resolvedSourceType {
    if (sourceType != SvgSourceType.auto) {
      return sourceType;
    }

    // Auto-detect based on content
    if (source.startsWith('http://') || source.startsWith('https://')) {
      return SvgSourceType.network;
    } else if (source.trimLeft().startsWith('<svg') ||
        source.trimLeft().startsWith('<?xml')) {
      return SvgSourceType.string;
    } else {
      return SvgSourceType.asset;
    }
  }

  ColorFilter? get _colorFilter {
    if (color == null) return null;
    return ColorFilter.mode(color!, colorBlendMode);
  }

  @override
  Widget build(BuildContext context) {
    switch (_resolvedSourceType) {
      case SvgSourceType.network:
        return _buildNetworkSvg(context);
      case SvgSourceType.asset:
        return _buildAssetSvg(context);
      case SvgSourceType.string:
        return _buildStringSvg(context);
      case SvgSourceType.auto:
        // Should never reach here due to _resolvedSourceType
        return _buildAssetSvg(context);
    }
  }

  Widget _buildNetworkSvg(BuildContext context) {
    return SvgPicture.network(
      source,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      colorFilter: _colorFilter,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      theme: theme ?? const SvgTheme(),
      headers: headers ?? const {},
      placeholderBuilder:
          showLoadingIndicator ? (context) => _buildLoadingWidget(context) : null,
      errorBuilder: (context, error, stackTrace) => _buildErrorWidget(context),
    );
  }

  Widget _buildAssetSvg(BuildContext context) {
    return SvgPicture.asset(
      source,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      colorFilter: _colorFilter,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      theme: theme ?? const SvgTheme(),
      placeholderBuilder:
          showLoadingIndicator ? (context) => _buildLoadingWidget(context) : null,
      errorBuilder: (context, error, stackTrace) => _buildErrorWidget(context),
    );
  }

  Widget _buildStringSvg(BuildContext context) {
    return SvgPicture.string(
      source,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      colorFilter: _colorFilter,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      theme: theme ?? const SvgTheme(),
    );
  }

  Widget _buildLoadingWidget(BuildContext context) {
    if (loadingWidget != null) {
      return loadingWidget!;
    }

    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    if (fallbackWidget != null) {
      return fallbackWidget!;
    }

    final icon = fallbackIcon ?? Icons.broken_image_outlined;
    final iconSize = _calculateIconSize();
    final iconColor =
        color ?? Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.5);

    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }

  double _calculateIconSize() {
    if (width != null && height != null) {
      final minDimension = width! < height! ? width! : height!;
      return minDimension.clamp(16.0, 48.0);
    }
    if (width != null) return width!.clamp(16.0, 48.0);
    if (height != null) return height!.clamp(16.0, 48.0);
    return 24.0;
  }
}
