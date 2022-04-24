import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class GameField extends Component {
  final gridPaint = Paint()
    ..color = const Color(0x6F1AFF00)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 0.07;

  @override
  void render(Canvas canvas) {
    const cellSize = 10;
    const fieldWidth = (50 * cellSize);
    const fieldHeight = (50 * cellSize);
    for (var i = 0.0; i < 41; i++) {
      canvas.drawLine(Offset(i, 0), Offset(i, 40), gridPaint);
    }
    for (var i = 0.0; i < 41; i++) {
      canvas.drawLine(Offset(0, i), Offset(40, i), gridPaint);
    }
  }
}
