import 'dart:ui';

import 'package:flame/components.dart';

class CellComponent extends PositionComponent {
  CellComponent(int x, int y)
      : super(
          position: Vector2(x * 1.0 - 1, y * 1.0 - 1),
          size: Vector2(0.99, 0.99),
        );
  final cellPaint = Paint()..color = const Color(0xFF1AFF00);

  @override
  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(0, 0, width, height), cellPaint);
  }
}
