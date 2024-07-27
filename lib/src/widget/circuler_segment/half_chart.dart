import 'dart:math';

import 'package:flutter/material.dart';

class HalfCircularProgressIndicator extends StatelessWidget {
  final double value;

  const HalfCircularProgressIndicator({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(180, 180),
      painter: _HalfCirclePainter(
        value: value,
        backgroundColor: const Color(0xff757079),
        color: Colors.white,
      ),
    );
  }
}

class _HalfCirclePainter extends CustomPainter {
  final double value;
  final Color backgroundColor;
  final Color color;

  _HalfCirclePainter({
    required this.value,
    required this.backgroundColor,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final Paint valuePaint = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Rect rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    const double startAngle = 360;
    final double sweepAngle = pi * value;

    // Draw the background circle (full half-circle)
    canvas.drawArc(rect, startAngle, pi, false, backgroundPaint);

    // Draw the progress value (half-circle)
    canvas.drawArc(rect, startAngle, sweepAngle, false, valuePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
