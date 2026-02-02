import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

enum SplashExitMode {
  /// Fade out logo and background together
  fade,

  /// Move logo to target position
  move,

  /// Fade and move simultaneously
  fadeMove,

  /// Move first, then fade background only (logo stays visible)
  moveThenFadeBackground,

  /// Move logo to target, fade background, logo STAYS visible permanently
  /// Logo will remain rendered at target position after animation completes
  flyToTarget,
}

typedef SplashBuilder =
    Widget Function(BuildContext context, Animation<double> idle, Alignment logoAlignment);

typedef SplashErrorBuilder = Widget Function(BuildContext context, Object error);

/// A reusable splash wrapper that blocks the child until init completes.
class SplashGate extends StatefulWidget {
  const SplashGate({
    required this.child,
    this.onInit,
    this.minDisplay = const Duration(milliseconds: 900),
    this.exitMode = SplashExitMode.fadeMove,
    this.exitAlignment = const Alignment(0, -0.9),
    this.exitDuration = const Duration(milliseconds: 600),
    this.exitCurve = Curves.easeInOut,
    this.exitOpacity = 0.0,
    this.logo,
    this.logoAlignment = Alignment.center,
    this.logoPadding = const EdgeInsets.all(24),
    this.backgroundColor,
    this.backgroundGradient,
    this.splashBuilder,
    this.errorBuilder,
    this.onSplash,
    this.onFinish,
    this.onError,
    this.targetKey,
    this.targetScale = 1.0,
    this.targetOffsetY = 0.0,
    super.key,
  });

  final Widget child;
  final Future<void> Function()? onInit;
  final Duration minDisplay;
  final SplashExitMode exitMode;
  final Alignment exitAlignment;
  final Duration exitDuration;
  final Curve exitCurve;

  /// The final opacity when fade animation ends (0.0 = fully transparent, 1.0 = fully visible)
  /// Default is 0.0 (fully transparent)
  final double exitOpacity;

  /// GlobalKey of the target widget to animate to.
  /// When provided, the splash logo will animate to match the target's position.
  /// This overrides exitAlignment when the target position can be calculated.
  final GlobalKey? targetKey;

  /// Scale factor to apply when animating to target position.
  /// Default is 1.0 (same size as target)
  final double targetScale;

  /// Vertical offset to adjust target position (in pixels).
  /// Positive values move target down, negative values move target up.
  final double targetOffsetY;

  final Widget? logo;
  final Alignment logoAlignment;
  final EdgeInsets logoPadding;
  final Color? backgroundColor;
  final Gradient? backgroundGradient;
  final SplashBuilder? splashBuilder;
  final SplashErrorBuilder? errorBuilder;
  final VoidCallback? onSplash;
  final VoidCallback? onFinish;
  final void Function(Object error)? onError;

  @override
  State<SplashGate> createState() => _SplashGateState();
}

class _SplashGateState extends State<SplashGate> with TickerProviderStateMixin {
  late final AnimationController _idleController;
  late final AnimationController _exitController;
  late final Animation<double> _exitAnimation;

  // Second phase controller for moveThenFadeBackground mode
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  bool _finished = false;
  bool _moveCompleted = false; // Track if move phase is done
  bool _logoLanded = false; // Logo has "landed" at target (for flyToTarget mode)
  Object? _error;

  // For target position calculation
  Alignment? _targetAlignment;
  double? _targetScaleRatio;
  Size? _splashSize;

  // Absolute position for landed logo (more precise than alignment)
  Offset? _targetOffset;
  Size? _targetSize;

  // Starting position for move animation (center of screen)
  Offset? _startOffset;

  @override
  void initState() {
    super.initState();
    _idleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2600),
    )..repeat();
    _exitController = AnimationController(vsync: this, duration: widget.exitDuration);
    _exitAnimation = CurvedAnimation(parent: _exitController, curve: widget.exitCurve);

    // Fade controller for background fade (used in moveThenFadeBackground mode)
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _fadeAnimation = CurvedAnimation(parent: _fadeController, curve: Curves.easeOut);

    _run();
  }

  @override
  void didUpdateWidget(covariant SplashGate oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.exitDuration != widget.exitDuration) {
      _exitController.duration = widget.exitDuration;
    }
  }

  Future<void> _run() async {
    widget.onSplash?.call();
    final start = DateTime.now();
    try {
      await widget.onInit?.call();
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = error);
      widget.onError?.call(error);
      return;
    }

    final elapsed = DateTime.now().difference(start);
    final wait = widget.minDisplay - elapsed;
    if (wait > Duration.zero) {
      await Future<void>.delayed(wait);
    }
    if (!mounted) return;

    // Wait for layout to complete before calculating target position
    // This ensures the target widget has been rendered and positioned
    await _waitForLayout();
    if (!mounted) return;

    // Calculate target position if targetKey is provided
    _calculateTargetPosition();

    // Phase 1: Move animation
    await _exitController.forward();
    if (!mounted) return;

    // For modes with separate fade phase after move
    if (widget.exitMode == SplashExitMode.moveThenFadeBackground ||
        widget.exitMode == SplashExitMode.flyToTarget) {
      setState(() => _moveCompleted = true);
      // Stop wiggle animation when move is complete
      _idleController.stop();
      await _fadeController.forward();
      if (!mounted) return;

      // For flyToTarget, logo stays visible - don't set _finished
      if (widget.exitMode == SplashExitMode.flyToTarget) {
        setState(() => _logoLanded = true);
        widget.onFinish?.call();
        return; // Exit early, keep logo rendered
      }
    }

    setState(() => _finished = true);
    widget.onFinish?.call();
  }

  void _calculateTargetPosition() {
    if (widget.targetKey == null) return;

    final targetContext = widget.targetKey!.currentContext;
    if (targetContext == null) return;

    final targetBox = targetContext.findRenderObject() as RenderBox?;
    if (targetBox == null || !targetBox.hasSize) return;

    final splashContext = context;
    final splashBox = splashContext.findRenderObject() as RenderBox?;
    if (splashBox == null || !splashBox.hasSize) return;

    _splashSize = splashBox.size;
    _targetSize = targetBox.size;

    // Get target position in global coordinates
    final targetGlobalOffset = targetBox.localToGlobal(Offset.zero);

    // Store absolute offset for landed logo (relative to splash container)
    final splashGlobalOffset = splashBox.localToGlobal(Offset.zero);
    _targetOffset = Offset(
      targetGlobalOffset.dx - splashGlobalOffset.dx,
      targetGlobalOffset.dy - splashGlobalOffset.dy + widget.targetOffsetY,
    );

    // Calculate starting position (center of splash, accounting for logo size)
    // Logo starts at center, so we need to offset by half the target size
    _startOffset = Offset(
      (_splashSize!.width - _targetSize!.width) / 2,
      (_splashSize!.height - _targetSize!.height) / 2,
    );

    // Calculate target center position in screen coordinates (with offset adjustment)
    final targetCenterX = targetGlobalOffset.dx + _targetSize!.width / 2;
    final targetCenterY = targetGlobalOffset.dy + _targetSize!.height / 2 + widget.targetOffsetY;

    // Convert to alignment (-1 to 1 range) relative to full screen
    final splashWidth = _splashSize!.width;
    final splashHeight = _splashSize!.height;

    // Alignment formula: (position - center) / (size / 2)
    final alignX = (targetCenterX - splashWidth / 2) / (splashWidth / 2);
    final alignY = (targetCenterY - splashHeight / 2) / (splashHeight / 2);

    _targetAlignment = Alignment(alignX.clamp(-1.0, 1.0), alignY.clamp(-1.0, 1.0));

    // Calculate scale ratio based on target size vs logo size (assuming 200 for logo)
    // This is approximate - actual logo size would need to be passed or measured
    _targetScaleRatio = widget.targetScale;
  }

  /// Waits for the next frame to ensure layout is complete
  Future<void> _waitForLayout() async {
    final completer = Completer<void>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        completer.complete();
      }
    });
    return completer.future;
  }

  @override
  void dispose() {
    _idleController.dispose();
    _exitController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        // Don't show splash overlay if logo has landed (to avoid duplicate logo)
        if (!_finished && !_logoLanded) _buildSplashOverlay(),
        // Keep logo visible after landing in flyToTarget mode
        if (_logoLanded) _buildLandedLogo(),
      ],
    );
  }

  /// Builds the logo that stays visible after flying to target
  Widget _buildLandedLogo() {
    final scale = _targetScaleRatio ?? widget.targetScale;

    // Use absolute positioning if we have target offset, otherwise fallback to alignment
    if (_targetOffset != null && _targetSize != null) {
      return Positioned(
        left: _targetOffset!.dx,
        top: _targetOffset!.dy,
        width: _targetSize!.width,
        height: _targetSize!.height,
        child: IgnorePointer(
          child: Center(
            child: Transform.scale(
              scale: scale,
              child: widget.logo ?? const FlutterLogo(size: 120),
            ),
          ),
        ),
      );
    }

    // Fallback to alignment-based positioning
    final endAlignment = _targetAlignment ?? widget.exitAlignment;
    return Positioned.fill(
      child: IgnorePointer(
        child: Align(
          alignment: endAlignment,
          child: Padding(
            padding: widget.logoPadding,
            child: Transform.scale(
              scale: scale,
              child: widget.logo ?? const FlutterLogo(size: 120),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSplashOverlay() {
    // For modes with separate move and fade phases
    if (widget.exitMode == SplashExitMode.moveThenFadeBackground ||
        widget.exitMode == SplashExitMode.flyToTarget) {
      return _buildMoveThenFadeOverlay();
    }

    // Original behavior for other modes
    return Positioned.fill(
      child: AnimatedBuilder(
        animation: _exitAnimation,
        builder: (context, _) {
          final t = _exitAnimation.value;

          // Use target alignment if calculated, otherwise fallback to exitAlignment
          final endAlignment = _targetAlignment ?? widget.exitAlignment;
          final alignment =
              _shouldMove
                  ? Alignment.lerp(widget.logoAlignment, endAlignment, t)!
                  : widget.logoAlignment;

          // Calculate scale if targeting specific position
          final scale = _targetScaleRatio != null && _shouldMove
              ? 1.0 + ((_targetScaleRatio! - 1.0) * t)
              : 1.0;

          final opacity = _shouldFade
              ? 1.0 - (t * (1.0 - widget.exitOpacity))
              : 1.0;

          return Opacity(
            opacity: opacity,
            child: _error == null
                ? _buildSplash(context, alignment, scale)
                : _buildError(context),
          );
        },
      ),
    );
  }

  Widget _buildMoveThenFadeOverlay() {
    return Positioned.fill(
      child: AnimatedBuilder(
        animation: Listenable.merge([_exitAnimation, _fadeAnimation]),
        builder: (context, _) {
          final moveT = _exitAnimation.value;
          final fadeT = _fadeAnimation.value;

          // Scale animation during move
          final scale = _targetScaleRatio != null
              ? 1.0 + ((_targetScaleRatio! - 1.0) * moveT)
              : 1.0;

          // Background fades out after move completes
          final bgOpacity = _moveCompleted ? (1.0 - fadeT) : 1.0;

          // Logo opacity: for flyToTarget, logo stays fully visible
          // For moveThenFadeBackground, logo fades with exitOpacity
          final logoOpacity = widget.exitMode == SplashExitMode.flyToTarget
              ? 1.0 // Always visible for flyToTarget
              : (_moveCompleted
                  ? widget.exitOpacity + ((1.0 - widget.exitOpacity) * (1.0 - fadeT))
                  : 1.0);

          // Use absolute positioning if we have start and target offsets
          final useAbsolutePositioning = _startOffset != null && _targetOffset != null && _targetSize != null;

          return Stack(
            children: [
              // Background layer - fades out
              Positioned.fill(
                child: Opacity(
                  opacity: bgOpacity,
                  child: _buildBackground(context),
                ),
              ),
              // Logo layer - use absolute positioning for precise movement
              if (useAbsolutePositioning)
                _buildAbsolutePositionedLogo(moveT, scale, logoOpacity)
              else
                _buildAlignmentPositionedLogo(moveT, scale, logoOpacity),
            ],
          );
        },
      ),
    );
  }

  /// Build logo with absolute positioning (for flyToTarget mode)
  Widget _buildAbsolutePositionedLogo(double moveT, double scale, double logoOpacity) {
    final currentOffset = Offset.lerp(_startOffset!, _targetOffset!, moveT)!;

    return Positioned(
      left: currentOffset.dx,
      top: currentOffset.dy,
      width: _targetSize!.width,
      height: _targetSize!.height,
      child: Opacity(
        opacity: logoOpacity,
        child: Center(
          child: Transform.scale(
            scale: scale,
            child: _moveCompleted
                ? (widget.logo ?? const FlutterLogo(size: 120))
                : _WiggleLogo(
                    animation: _idleController,
                    child: widget.logo ?? const FlutterLogo(size: 120),
                  ),
          ),
        ),
      ),
    );
  }

  /// Build logo with alignment positioning (fallback for other modes)
  Widget _buildAlignmentPositionedLogo(double moveT, double scale, double logoOpacity) {
    final endAlignment = _targetAlignment ?? widget.exitAlignment;
    final alignment = Alignment.lerp(widget.logoAlignment, endAlignment, moveT)!;

    return Positioned.fill(
      child: Opacity(
        opacity: logoOpacity,
        child: _buildLogoOnly(context, alignment, scale),
      ),
    );
  }

  bool get _shouldFade =>
      widget.exitMode == SplashExitMode.fade ||
      widget.exitMode == SplashExitMode.fadeMove;

  bool get _shouldMove =>
      widget.exitMode == SplashExitMode.move ||
      widget.exitMode == SplashExitMode.fadeMove;

  BoxDecoration get _backgroundDecoration {
    return widget.backgroundGradient != null
        ? BoxDecoration(gradient: widget.backgroundGradient)
        : BoxDecoration(
            color:
                widget.backgroundColor ??
                Theme.of(context).scaffoldBackgroundColor,
          );
  }

  Widget _buildBackground(BuildContext context) {
    return DecoratedBox(
      decoration: _backgroundDecoration,
      child: const SizedBox.expand(),
    );
  }

  Widget _buildLogoOnly(BuildContext context, Alignment logoAlignment, [double scale = 1.0]) {
    return Align(
      alignment: logoAlignment,
      child: Padding(
        padding: widget.logoPadding,
        child: Transform.scale(
          scale: scale,
          child: _moveCompleted
              ? (widget.logo ?? const FlutterLogo(size: 120)) // No wiggle after move
              : _WiggleLogo(
                  animation: _idleController,
                  child: widget.logo ?? const FlutterLogo(size: 120),
                ),
        ),
      ),
    );
  }

  Widget _buildSplash(BuildContext context, Alignment logoAlignment, [double scale = 1.0]) {
    if (widget.splashBuilder != null) {
      return widget.splashBuilder!(context, _idleController, logoAlignment);
    }

    // When using targetKey, don't wrap with SafeArea to allow precise positioning
    final useTargetPositioning = _targetAlignment != null;

    final logoWidget = Align(
      alignment: logoAlignment,
      child: Padding(
        padding: widget.logoPadding,
        child: Transform.scale(
          scale: scale,
          child: _WiggleLogo(
            animation: _idleController,
            child: widget.logo ?? const FlutterLogo(size: 120),
          ),
        ),
      ),
    );

    return DecoratedBox(
      decoration: _backgroundDecoration,
      child: useTargetPositioning ? logoWidget : SafeArea(child: logoWidget),
    );
  }

  Widget _buildError(BuildContext context) {
    if (widget.errorBuilder != null) {
      return widget.errorBuilder!(context, _error!);
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color:
            widget.backgroundColor ??
            Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Center(
        child: Text(
          'Something went wrong',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}

class _WiggleLogo extends StatelessWidget {
  const _WiggleLogo({
    required this.animation,
    required this.child,
  });

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        final phase = animation.value * 2 * math.pi;
        final rotate = math.sin(phase) * 0.08;
        final float = math.sin(phase + math.pi / 2) * 6;
        final scale = 1 + math.sin(phase + math.pi) * 0.02;

        return Transform.translate(
          offset: Offset(0, float),
          child: Transform.rotate(
            angle: rotate,
            child: Transform.scale(
              scale: scale,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
