import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:gameoflife/cell.dart';
import 'package:gameoflife/cell_component.dart';

import 'field.dart';
import 'game_field.dart';

class GameOfLife extends FlameGame {
  final world = World();
  late final Field field;

  @override
  Future<void> onLoad() async {
    final camera = CameraComponent(world: world);
    add(world);
    add(camera);
    camera.viewfinder.zoom = 15;
    camera.viewfinder.position = Vector2(25, 25);
    world.add(GameField());

    field = Field(this);
    field.cells.addAll([
      Cell(2, 1),
      Cell(3, 2),
      Cell(3, 3),
      Cell(2, 3),
      Cell(1, 3),
      Cell(10, 10),
    ]);
    field.addCellsToGame();
  }

  double timer = 0;
  double stepTime = 0.25;

  @override
  void update(double dt) {
    super.update(dt);
    timer += dt;
    if (timer > stepTime) {
      field.generation();
      timer -= stepTime;
    }
  }
}
