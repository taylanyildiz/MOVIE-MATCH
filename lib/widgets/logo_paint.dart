import 'dart:ui';

import 'package:flutter/material.dart';

class LogoPaint extends CustomPainter {
  final Paint pathPaint;
  final double offset;
  bool isAnim;
  LogoPaint({
    this.offset,
    this.isAnim = true,
  })  : pathPaint = Paint()
          ..color = Colors.red
          ..strokeWidth = 8.0
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round,
        super();
  @override
  void paint(Canvas canvas, Size size) {
    if (isAnim)
      _drawAnimLogo(canvas, size);
    else
      _drawTransitionLogo(canvas, size);
  }

  void _drawTransitionLogo(canvas, size) {
    Path path = createPath(size);
    canvas.drawPath(path, pathPaint);
  }

  void _drawAnimLogo(Canvas canvas, size) {
    Path path = createPath(size);
    PathMetric pathMetric = path.computeMetrics().first;
    Path extracthPath = pathMetric.extractPath(0.0, pathMetric.length * offset);
    canvas.drawPath(extracthPath, pathPaint);
  }

  Path createPath(Size size) {
    Path path = Path();
    path.moveTo(size.width - size.height / 10.0, size.height);
    path.lineTo(size.height * .1, size.height);
    path.lineTo(size.height * .1, size.height * .1);
    path.lineTo(size.width - size.height * .1, size.height * .1);
    path.lineTo(size.width - size.height * .1, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
