import 'package:flutter/material.dart';
import '../utils/speech.dart';

class ShapeGame extends StatelessWidget {
  const ShapeGame({super.key});

  void _speakShape(String shape) {
    speak(shape); // from speech.dart
  }

  Widget buildShape({
    required String label,
    required Color color,
    required Widget child,
  }) {
    return GestureDetector(
      onTap: () => _speakShape(label),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
              borderRadius: label == 'Circle'
                  ? BorderRadius.circular(100)
                  : BorderRadius.circular(10),
            ),
            child: child,
          ),
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
          children: [
            buildShape(
              label: 'Circle',
              color: Colors.redAccent,
              child: const SizedBox(),
            ),
            buildShape(
              label: 'Square',
              color: Colors.blue,
              child: const SizedBox(),
            ),
            buildShape(
              label: 'Triangle',
              color: Colors.green,
              child: CustomPaint(
                painter: TrianglePainter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.green;
    final path = Path()
      ..moveTo(50, 0)
      ..lineTo(0, 100)
      ..lineTo(100, 100)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
