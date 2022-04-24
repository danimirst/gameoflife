
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:gameoflife/cell.dart';

import 'game_field.dart';


class GameOfLife extends FlameGame {
  @override
  Future<void> onLoad() async {
    final world = World();
    final camera = CameraComponent(world: world);
    add(world);
    add(camera);

    camera.viewfinder.zoom = 15;
    camera.viewfinder.position = Vector2(25, 25);
    world.add(GameField());
    world.add(Cell(2, 1));
    world.add(Cell(3, 2));
    world.add(Cell(3, 3));
    world.add(Cell(2, 3));
    world.add(Cell(1, 3));
  }
}
