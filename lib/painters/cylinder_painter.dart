import 'package:flutter/material.dart';

class CylinderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.deepPurple
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final double width = size.width;
    final double height = size.height;
    final double ellipseHeight = height * 0.2;

    // Top ellipse
    Rect topOval = Rect.fromLTWH(0, 0, width, ellipseHeight);
    canvas.drawOval(topOval, paint);
    canvas.drawOval(topOval, strokePaint);

    // Bottom ellipse
    Rect bottomOval = Rect.fromLTWH(0, height - ellipseHeight, width, ellipseHeight);
    canvas.drawOval(bottomOval, paint);
    canvas.drawOval(bottomOval, strokePaint);

    // Sides
    final leftSide = Path()
      ..moveTo(0, ellipseHeight / 2)
      ..lineTo(0, height - ellipseHeight / 2);
    final rightSide = Path()
      ..moveTo(width, ellipseHeight / 2)
      ..lineTo(width, height - ellipseHeight / 2);

    canvas.drawPath(leftSide, strokePaint);
    canvas.drawPath(rightSide, strokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
