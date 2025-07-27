import 'package:flutter/material.dart';
class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.purple;
    final path = Path();

    path.moveTo(size.width / 2, size.height * 0.75);
    path.cubicTo(
      size.width * 1.2, size.height * 0.3,
      size.width * 0.8, size.height * -0.2,
      size.width / 2, size.height * 0.2,
    );
    path.cubicTo(
      size.width * 0.2, size.height * -0.2,
      size.width * -0.2, size.height * 0.3,
      size.width / 2, size.height * 0.75,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
