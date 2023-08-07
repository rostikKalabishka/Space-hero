import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:space_hero/entites/player.dart';
import 'package:space_hero/scenes/app_scene.dart';

class GameScene extends AppScene {
  Player _player = Player();

  @override
  Widget buildScene() {
    return Stack(
      children: [_player.build()],
    );
  }

  @override
  void update() {
    _player.update();
  }

  GameScene();
}
