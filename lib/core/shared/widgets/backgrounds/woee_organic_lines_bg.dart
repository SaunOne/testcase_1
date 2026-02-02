import 'dart:math' as math;

import 'package:flutter/material.dart';

/// A background widget with organic, irregular flowing lines
/// Creates a modern, artistic pattern that feels hand-drawn
class WoeeOrganicLinesBg extends StatelessWidget {
  const WoeeOrganicLinesBg({
    this.child,
    this.lineColor,
    this.lineWidth = 1.0,
    this.opacity = 0.08,
    this.lineCount = 12,
    this.seed = 42,
    this.curveIntensity = 0.3,
    super.key,
  });

  final Widget? child;
  final Color? lineColor;
  final double lineWidth;
  final double opacity;
  final int lineCount;
  final int seed;

  /// How wavy the lines are (0.0 = straight, 1.0 = very wavy)
  final double curveIntensity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: _OrganicLinesPainter(
              lineColor: lineColor ??
                  Theme.of(context).colorScheme.outline.withValues(alpha: opacity),
              lineWidth: lineWidth,
              lineCount: lineCount,
              seed: seed,
              curveIntensity: curveIntensity,
            ),
          ),
        ),
        if (child != null) child!,
      ],
    );
  }
}

class _OrganicLinesPainter extends CustomPainter {
  _OrganicLinesPainter({
    required this.lineColor,
    required this.lineWidth,
    required this.lineCount,
    required this.seed,
    required this.curveIntensity,
  });

  final Color lineColor;
  final double lineWidth;
  final int lineCount;
  final int seed;
  final double curveIntensity;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final random = math.Random(seed);

    for (var i = 0; i < lineCount; i++) {
      _drawOrganicLine(canvas, size, paint, random, i);
    }
  }

  void _drawOrganicLine(
    Canvas canvas,
    Size size,
    Paint paint,
    math.Random random,
    int index,
  ) {
    final path = Path();

    // Determine line direction (horizontal or vertical tendency)
    final isHorizontal = random.nextBool();

    if (isHorizontal) {
      _drawHorizontalLine(canvas, size, paint, random, path, index);
    } else {
      _drawVerticalLine(canvas, size, paint, random, path, index);
    }
  }

  void _drawHorizontalLine(
    Canvas canvas,
    Size size,
    Paint paint,
    math.Random random,
    Path path,
    int index,
  ) {
    // Start from left edge at random y
    final startY = random.nextDouble() * size.height;
    final startOffset = random.nextDouble() * 50 - 25;

    path.moveTo(startOffset, startY);

    // Create control points for bezier curves
    final segments = 3 + random.nextInt(3);
    final segmentWidth = (size.width - startOffset) / segments;

    var currentX = startOffset;
    var currentY = startY;

    for (var s = 0; s < segments; s++) {
      final endX = currentX + segmentWidth + (random.nextDouble() - 0.5) * 30;
      final endY = currentY +
          (random.nextDouble() - 0.5) * size.height * curveIntensity * 0.5;

      // Control points
      final cp1x = currentX + segmentWidth * 0.3 + (random.nextDouble() - 0.5) * 40;
      final cp1y = currentY + (random.nextDouble() - 0.5) * 80 * curveIntensity;
      final cp2x = currentX + segmentWidth * 0.7 + (random.nextDouble() - 0.5) * 40;
      final cp2y = endY + (random.nextDouble() - 0.5) * 80 * curveIntensity;

      path.cubicTo(cp1x, cp1y, cp2x, cp2y, endX, endY.clamp(0, size.height));

      currentX = endX;
      currentY = endY.clamp(0, size.height);
    }

    canvas.drawPath(path, paint);
  }

  void _drawVerticalLine(
    Canvas canvas,
    Size size,
    Paint paint,
    math.Random random,
    Path path,
    int index,
  ) {
    // Start from top edge at random x
    final startX = random.nextDouble() * size.width;
    final startOffset = random.nextDouble() * 50 - 25;

    path.moveTo(startX, startOffset);

    // Create control points for bezier curves
    final segments = 3 + random.nextInt(3);
    final segmentHeight = (size.height - startOffset) / segments;

    var currentX = startX;
    var currentY = startOffset;

    for (var s = 0; s < segments; s++) {
      final endY = currentY + segmentHeight + (random.nextDouble() - 0.5) * 30;
      final endX = currentX +
          (random.nextDouble() - 0.5) * size.width * curveIntensity * 0.5;

      // Control points
      final cp1x = currentX + (random.nextDouble() - 0.5) * 80 * curveIntensity;
      final cp1y = currentY + segmentHeight * 0.3 + (random.nextDouble() - 0.5) * 40;
      final cp2x = endX + (random.nextDouble() - 0.5) * 80 * curveIntensity;
      final cp2y = currentY + segmentHeight * 0.7 + (random.nextDouble() - 0.5) * 40;

      path.cubicTo(cp1x, cp1y, cp2x, cp2y, endX.clamp(0, size.width), endY);

      currentX = endX.clamp(0, size.width);
      currentY = endY;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _OrganicLinesPainter oldDelegate) {
    return oldDelegate.lineColor != lineColor ||
        oldDelegate.lineWidth != lineWidth ||
        oldDelegate.lineCount != lineCount ||
        oldDelegate.seed != seed ||
        oldDelegate.curveIntensity != curveIntensity;
  }
}

/// A variant that combines grid lines with organic decorative lines
class WoeeHybridLinesBg extends StatelessWidget {
  const WoeeHybridLinesBg({
    this.child,
    this.lineColor,
    this.gridLineWidth = 1.0,
    this.organicLineWidth = 1.2,
    this.gridOpacity = 0.05,
    this.organicOpacity = 0.08,
    this.gridSpacing = 80.0,
    this.organicLineCount = 8,
    this.seed = 42,
    this.curveIntensity = 0.25,
    this.showGrid = true,
    this.showOrganic = true,
    super.key,
  });

  final Widget? child;
  final Color? lineColor;
  final double gridLineWidth;
  final double organicLineWidth;
  final double gridOpacity;
  final double organicOpacity;
  final double gridSpacing;
  final int organicLineCount;
  final int seed;
  final double curveIntensity;
  final bool showGrid;
  final bool showOrganic;

  @override
  Widget build(BuildContext context) {
    final baseColor = lineColor ?? Theme.of(context).colorScheme.outline;

    return Stack(
      children: [
        // Grid layer (subtle)
        if (showGrid)
          Positioned.fill(
            child: CustomPaint(
              painter: _SimpleGridPainter(
                lineColor: baseColor.withValues(alpha: gridOpacity),
                lineWidth: gridLineWidth,
                spacing: gridSpacing,
              ),
            ),
          ),
        // Organic lines layer
        if (showOrganic)
          Positioned.fill(
            child: WoeeOrganicLinesBg(
              lineColor: baseColor.withValues(alpha: organicOpacity),
              lineWidth: organicLineWidth,
              lineCount: organicLineCount,
              seed: seed,
              curveIntensity: curveIntensity,
            ),
          ),
        if (child != null) child!,
      ],
    );
  }
}

class _SimpleGridPainter extends CustomPainter {
  _SimpleGridPainter({
    required this.lineColor,
    required this.lineWidth,
    required this.spacing,
  });

  final Color lineColor;
  final double lineWidth;
  final double spacing;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke;

    // Vertical lines
    var x = 0.0;
    while (x <= size.width) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
      x += spacing;
    }

    // Horizontal lines
    var y = 0.0;
    while (y <= size.height) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
      y += spacing;
    }
  }

  @override
  bool shouldRepaint(covariant _SimpleGridPainter oldDelegate) {
    return oldDelegate.lineColor != lineColor ||
        oldDelegate.lineWidth != lineWidth ||
        oldDelegate.spacing != spacing;
  }
}
