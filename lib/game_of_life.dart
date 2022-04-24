
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';

import 'game_field.dart';


class GameOfLife extends FlameGame {
  @override
  Future<void> onLoad() async {
    final world = World();
    final camera = CameraComponent(world: world);
    add(world);
    add(camera);

    camera.viewfinder.zoom = 1.5;
    camera.viewfinder.position = Vector2(250, 250);
    world.add(GameField());
  }
}
