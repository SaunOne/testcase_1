import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Default fallback placeholder when image fails to load
const String kDefaultFallbackAsset = 'assets/images/commons/placeholder.png';

/// Image source type
enum ImageSourceType {
  /// Load from network URL
  network,

  /// Load from local asset
  asset,

  /// Auto-detect based on path (starts with http/https = network, else asset)
  auto,
}

/// A unified image widget that handles network images, assets, loading states,
/// and error fallbacks gracefully.
///
/// Features:
/// - Network image caching via cached_network_image
/// - Asset image loading
/// - Custom loading placeholder
/// - Custom error/fallback widget
/// - Automatic source detection
/// - Configurable fit, alignment, and sizing
///
/// Example usage:
/// ```dart
/// // Network image with fallback
/// AppImage.network(
///   'https://example.com/image.png',
///   fallbackAsset: 'assets/images/fallback.png',
/// )
///
/// // Asset image
/// AppImage.asset('assets/images/logo.png')
///
/// // Auto-detect source
/// AppImage(
///   path: imageUrl, // can be URL or asset path
///   width: 100,
///   height: 100,
/// )
/// ```
class AppImage extends StatelessWidget {
  const AppImage({
    required this.path,
    this.sourceType = ImageSourceType.auto,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.color,
    this.colorBlendMode,
    this.borderRadius,
    this.fallbackAsset,
    this.fallbackWidget,
    this.loadingWidget,
    this.showLoadingIndicator = true,
    this.loadingIndicatorSize = 24.0,
    this.fadeInDuration = const Duration(milliseconds: 300),
    this.cacheKey,
    this.headers,
    super.key,
  });

  /// Create an AppImage from network URL
  const AppImage.network(
    String url, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    Alignment alignment = Alignment.center,
    Color? color,
    BlendMode? colorBlendMode,
    BorderRadius? borderRadius,
    String? fallbackAsset,
    Widget? fallbackWidget,
    Widget? loadingWidget,
    bool showLoadingIndicator = true,
    double loadingIndicatorSize = 24.0,
    Duration fadeInDuration = const Duration(milliseconds: 300),
    String? cacheKey,
    Map<String, String>? headers,
    Key? key,
  }) : this(
          path: url,
          sourceType: ImageSourceType.network,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
          color: color,
          colorBlendMode: colorBlendMode,
          borderRadius: borderRadius,
          fallbackAsset: fallbackAsset,
          fallbackWidget: fallbackWidget,
          loadingWidget: loadingWidget,
          showLoadingIndicator: showLoadingIndicator,
          loadingIndicatorSize: loadingIndicatorSize,
          fadeInDuration: fadeInDuration,
          cacheKey: cacheKey,
          headers: headers,
          key: key,
        );

  /// Create an AppImage from asset path
  const AppImage.asset(
    String assetPath, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    Alignment alignment = Alignment.center,
    Color? color,
    BlendMode? colorBlendMode,
    BorderRadius? borderRadius,
    String? fallbackAsset,
    Widget? fallbackWidget,
    Key? key,
  }) : this(
          path: assetPath,
          sourceType: ImageSourceType.asset,
          width: width,
          height: height,
          fit: fit,
          alignment: alignment,
          color: color,
          colorBlendMode: colorBlendMode,
          borderRadius: borderRadius,
          fallbackAsset: fallbackAsset,
          fallbackWidget: fallbackWidget,
          showLoadingIndicator: false,
          key: key,
        );

  /// The image path (URL for network, path for asset)
  final String path;

  /// Source type (network, asset, or auto-detect)
  final ImageSourceType sourceType;

  /// Width of the image
  final double? width;

  /// Height of the image
  final double? height;

  /// How the image should be inscribed into the space
  final BoxFit fit;

  /// Alignment of the image within its bounds
  final Alignment alignment;

  /// Color to blend with the image
  final Color? color;

  /// Blend mode for the color
  final BlendMode? colorBlendMode;

  /// Border radius for clipping
  final BorderRadius? borderRadius;

  /// Fallback asset path when image fails to load
  final String? fallbackAsset;

  /// Custom fallback widget when image fails to load
  /// Takes precedence over [fallbackAsset]
  final Widget? fallbackWidget;

  /// Custom loading widget
  /// Takes precedence over default loading indicator
  final Widget? loadingWidget;

  /// Whether to show loading indicator for network images
  final bool showLoadingIndicator;

  /// Size of the loading indicator
  final double loadingIndicatorSize;

  /// Duration of fade-in animation for network images
  final Duration fadeInDuration;

  /// Custom cache key for network images
  final String? cacheKey;

  /// HTTP headers for network requests
  final Map<String, String>? headers;

  bool get _isNetworkImage {
    switch (sourceType) {
      case ImageSourceType.network:
        return true;
      case ImageSourceType.asset:
        return false;
      case ImageSourceType.auto:
        return path.startsWith('http://') || path.startsWith('https://');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (_isNetworkImage) {
      imageWidget = _buildNetworkImage(context);
    } else {
      imageWidget = _buildAssetImage(context);
    }

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: imageWidget,
      );
    }

    return imageWidget;
  }

  Widget _buildNetworkImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: path,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      color: color,
      colorBlendMode: colorBlendMode,
      cacheKey: cacheKey,
      httpHeaders: headers,
      fadeInDuration: fadeInDuration,
      placeholder: showLoadingIndicator
          ? (context, url) => _buildLoadingWidget(context)
          : null,
      errorWidget: (context, url, error) => _buildErrorWidget(context),
    );
  }

  Widget _buildAssetImage(BuildContext context) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      color: color,
      colorBlendMode: colorBlendMode,
      errorBuilder: (context, error, stackTrace) => _buildErrorWidget(context),
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
          width: loadingIndicatorSize,
          height: loadingIndicatorSize,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    // Priority: fallbackWidget > fallbackAsset > default icon
    if (fallbackWidget != null) {
      return fallbackWidget!;
    }

    final fallback = fallbackAsset ?? kDefaultFallbackAsset;

    // Try to load fallback asset, if fails show icon
    return Image.asset(
      fallback,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      errorBuilder: (context, error, stackTrace) => _buildDefaultFallback(context),
    );
  }

  Widget _buildDefaultFallback(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Icon(
        Icons.image_not_supported_outlined,
        size: _calculateIconSize(),
        color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
      ),
    );
  }

  double _calculateIconSize() {
    if (width != null && height != null) {
      final minDimension = width! < height! ? width! : height!;
      return (minDimension * 0.3).clamp(16.0, 48.0);
    }
    return 32.0;
  }
}
