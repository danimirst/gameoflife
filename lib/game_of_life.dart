
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:gameoflife/cell_component.dart';

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
    world.add(CellComponent(2, 1));
    world.add(CellComponent(3, 2));
    world.add(CellComponent(3, 3));
    world.add(CellComponent(2, 3));
    world.add(CellComponent(1, 3));
  }
}
