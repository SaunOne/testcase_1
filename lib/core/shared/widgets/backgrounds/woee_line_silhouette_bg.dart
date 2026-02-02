import 'package:flutter/material.dart';

/// A reusable background widget with subtle line silhouette pattern
/// Creates a glassmorphism-friendly grid pattern
class WoeeLineSilhouetteBg extends StatelessWidget {
  const WoeeLineSilhouetteBg({
    this.child,
    this.lineColor,
    this.lineWidth = 1.0,
    this.gridSpacing = 80.0,
    this.opacity = 0.08,
    this.showVerticalLines = true,
    this.showHorizontalLines = true,
    super.key,
  });

  final Widget? child;
  final Color? lineColor;
  final double lineWidth;
  final double gridSpacing;
  final double opacity;
  final bool showVerticalLines;
  final bool showHorizontalLines;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: _LineSilhouettePainter(
              lineColor:
                  lineColor ??
                  Theme.of(
                    context,
                  ).colorScheme.outline.withValues(alpha: opacity),
              lineWidth: lineWidth,
              gridSpacing: gridSpacing,
              showVerticalLines: showVerticalLines,
              showHorizontalLines: showHorizontalLines,
            ),
          ),
        ),
        if (child != null) child!,
      ],
    );
  }
}

class _LineSilhouettePainter extends CustomPainter {
  _LineSilhouettePainter({
    required this.lineColor,
    required this.lineWidth,
    required this.gridSpacing,
    required this.showVerticalLines,
    required this.showHorizontalLines,
  });

  final Color lineColor;
  final double lineWidth;
  final double gridSpacing;
  final bool showVerticalLines;
  final bool showHorizontalLines;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke;

    // Draw vertical lines
    if (showVerticalLines) {
      var x = 0.0;
      while (x <= size.width) {
        canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
        x += gridSpacing;
      }
    }

    // Draw horizontal lines
    if (showHorizontalLines) {
      var y = 0.0;
      while (y <= size.height) {
        canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
        y += gridSpacing;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _LineSilhouettePainter oldDelegate) {
    return oldDelegate.lineColor != lineColor ||
        oldDelegate.lineWidth != lineWidth ||
        oldDelegate.gridSpacing != gridSpacing ||
        oldDelegate.showVerticalLines != showVerticalLines ||
        oldDelegate.showHorizontalLines != showHorizontalLines;
  }
}

/// A variant with gradient fade effect at edges
class WoeeLineSilhouetteBgFaded extends StatelessWidget {
  const WoeeLineSilhouetteBgFaded({
    this.child,
    this.lineColor,
    this.lineWidth = 1.0,
    this.gridSpacing = 80.0,
    this.opacity = 0.08,
    this.fadeTop = true,
    this.fadeBottom = true,
    super.key,
  });

  final Widget? child;
  final Color? lineColor;
  final double lineWidth;
  final double gridSpacing;
  final double opacity;
  final bool fadeTop;
  final bool fadeBottom;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WoeeLineSilhouetteBg(
          lineColor: lineColor,
          lineWidth: lineWidth,
          gridSpacing: gridSpacing,
          opacity: opacity,
        ),
        // Top fade
        if (fadeTop)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 100,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor,
                    Theme.of(
                      context,
                    ).scaffoldBackgroundColor.withValues(alpha: 0),
                  ],
                ),
              ),
            ),
          ),
        // Bottom fade
        if (fadeBottom)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 100,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor,
                    Theme.of(
                      context,
                    ).scaffoldBackgroundColor.withValues(alpha: 0),
                  ],
                ),
              ),
            ),
          ),
        if (child != null) child!,
      ],
    );
  }
}
