import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class GameField extends Component {
  final gridPaint = Paint()
    ..color = const Color(0xFF717171)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 0.5;

  @override
  void render(Canvas canvas) {
    const cellSize = 10;
    const fieldWidth = (50 * cellSize);
    const fieldHeight = (50 * cellSize);
    for (var i = 0; i < 50; i++) {
      canvas.drawLine(
        Offset((10.0 * i) - 0.5, 0),
        Offset((10.0 * i) - 0.5, 490),
        gridPaint,
      );
    }
    for (var i = 0; i < 50; i++) {
      canvas.drawLine(
        Offset(0, 10.0 * i),
        Offset(490, 10.0 * i),
        gridPaint,
      );
    }
  }
}

