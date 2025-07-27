import 'package:flutter/material.dart';
import 'package:shape_learning_app/painters/circle_painter.dart';
import 'package:shape_learning_app/painters/cylinder_painter.dart';
import 'package:shape_learning_app/painters/heart_painter.dart';
import 'package:shape_learning_app/painters/hexagon_painter.dart';
import 'package:shape_learning_app/painters/pentagon_painter.dart';
import 'package:shape_learning_app/painters/rectangle_painter.dart';
import 'package:shape_learning_app/painters/ring_painter.dart';
import 'package:shape_learning_app/painters/square_painter.dart';
import 'package:shape_learning_app/painters/star_painter.dart';
import 'package:shape_learning_app/painters/triangle_painter.dart';
import '../utils/speech.dart';

class ShapeGame extends StatelessWidget {
  const ShapeGame({super.key});

  void _speakShape(String shape) {
    speak(shape);
  }

  Widget buildShape({
    required String label,
    required CustomPainter painter,
  }) {
    return GestureDetector(
      onTap: () => _speakShape(label),
      child: Column(
        children: [
          CustomPaint(
            painter: painter,
            size: const Size(100, 100),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffef6e4),
      appBar: AppBar(
        title: const Text("Tap the Shape!"),
        centerTitle: true,
      ),
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 100,     // horizontal space
          runSpacing: 85,  // vertical space
          children: [
            buildShape(label: 'Circle', painter: CirclePainter()),
            buildShape(label: 'Square', painter: SquarePainter()),
            buildShape(label: 'Rectangle', painter: RectanglePainter()),
            buildShape(label: 'Triangle', painter: TrianglePainter()),
            buildShape(label: 'Pentagon', painter: PentagonPainter()),
            buildShape(label: 'Heart', painter: HeartPainter()),
            buildShape(label: 'Cylinder', painter: CylinderPainter()),
            buildShape(label: 'Ring', painter: RingPainter()),
            buildShape(label: 'Hexagon', painter: HexagonPainter()),
            buildShape(label: 'Star', painter: StarPainter()),
          ],
        ),
      ),
    );
  }
}
