import 'package:flutter/material.dart';
class SquarePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.blue;
    final squareSize = size.width < size.height ? size.width : size.height;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, squareSize, squareSize),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
