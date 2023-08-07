import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:space_hero/entites/player.dart';
import 'package:space_hero/scenes/app_scene.dart';
import 'package:space_hero/utilits/global_vars.dart';

import '../entites/bullet.dart';

class GameScene extends AppScene {
  Player _player = Player();
  double _startGlobalPosition = 0;

  List<Bullet> _listBullets = [];
  List<Widget> _listWidgets = [];

  @override
  Widget buildScene() {
    return Stack(
      children: [
        _player.build(),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: GlobalVars.screenWidth / 2,
            height: GlobalVars.screenHeight,
            child: GestureDetector(
              onPanStart: _onPanStart,
              onPanUpdate: _onPanUpdate,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: GlobalVars.screenWidth / 2,
          child: Container(
            width: GlobalVars.screenWidth / 2,
            height: GlobalVars.screenHeight / 2,
            child: GestureDetector(
              onTap: _onAcceleration,
              // onPanStart: _onPanStart,
              // onPanUpdate: _onPanUpdate,
            ),
          ),
        ),
        Positioned(
          top: GlobalVars.screenHeight / 2,
          left: GlobalVars.screenWidth / 2,
          child: Container(
            width: GlobalVars.screenWidth / 2,
            height: GlobalVars.screenHeight / 2,
            child: GestureDetector(
              onTap: _onShoot,
              // onPanStart: _onPanStart,
              // onPanUpdate: _onPanUpdate,
            ),
          ),
        ),
        Stack(
          children: _listWidgets,
        )
      ],
    );
  }

  @override
  void update() {
    _player.update();
    _listWidgets.clear();
    _listBullets.removeWhere((element) => !element.visible);
    _listBullets.forEach((element) {
      _listWidgets.add(element.build());
      element.update();
    });
  }

  GameScene();

  void _onPanStart(DragStartDetails details) {
    _startGlobalPosition = details.globalPosition.dx;
    print(_startGlobalPosition);
  }

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

  void _onAcceleration() {
    _player.isAcceleration = _player.isAcceleration ? false : true;
  }

  void _onShoot() {
    _listBullets.add(Bullet(
        playerAngle: _player.getAngle, playerX: _player.x, playerY: _player.y));
  }
}
