import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:space_hero/entites/player.dart';
import 'package:space_hero/scenes/app_scene.dart';
import 'package:space_hero/utilits/global_vars.dart';

class GameScene extends AppScene {
  Player _player = Player();
  double _startGlobalPosition = 0;

  @override
  Widget buildScene() {
    return Stack(
      children: [
        _player.build(),
        Positioned(
            top: 0,
            left: 0,
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.green)),
              width: GlobalVars.screenWidth / 2,
              height: GlobalVars.screenHeight,
              child: GestureDetector(
                onPanStart: _onPanStart,
                onPanUpdate: _onPanUpdate,
              ),
            ))
      ],
    );
  }

  @override
  void update() {
    _player.update();
  }

  void _onPanStart(DragStartDetails details) {
    _startGlobalPosition = details.globalPosition.dx;
    print(_startGlobalPosition);
  }

  GameScene();

  void _onPanUpdate(DragUpdateDetails details) {
    double updateGlobalPostion = details.globalPosition.dx;
    if (updateGlobalPostion > _startGlobalPosition + 30) {
      _player.isMoveRight = true;
      //right
    }
    if (updateGlobalPostion < _startGlobalPosition - 30) {
      _player.isMoveLeft = true;
      //left
    }
  }
}
