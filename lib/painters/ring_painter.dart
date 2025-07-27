import 'package:flutter/material.dart';

class RingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final outerRadius = size.width / 2;
    final innerRadius = outerRadius * 0.6;

    final center = Offset(size.width / 2, size.height / 2);

    final outerCircle = Path()..addOval(Rect.fromCircle(center: center, radius: outerRadius));
    final innerCircle = Path()..addOval(Rect.fromCircle(center: center, radius: innerRadius));

    final ring = Path.combine(PathOperation.difference, outerCircle, innerCircle);

    final paint = Paint()
      ..color = Colors.orangeAccent
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawPath(ring, paint);
    canvas.drawPath(outerCircle, borderPaint);
    canvas.drawPath(innerCircle, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
