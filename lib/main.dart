import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';

import 'game_of_life.dart';

void main() {
  runApp(GameWidget(game: GameOfLife()));
}

