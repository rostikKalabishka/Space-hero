import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:space_hero/entites/entity.dart';
import 'package:space_hero/entites/player.dart';
import 'package:space_hero/utilits/global_vars.dart';

class Bullet extends Entity {
  final double playerAngle;
  double _speed = 6;

  Bullet(
      {required this.playerAngle,
      required double playerX,
      required double playerY})
      : super('bullet') {
    x = playerX;
    y = playerY;
  }

  @override
  Widget build() {
    return Positioned(
        top: y,
        left: x,
        child: Transform.rotate(angle: playerAngle, child: sprites.first));
  }

  @override
  void move() {
    x += sin(playerAngle) * _speed;
    x -= cos(playerAngle) * _speed;
  }

  @override
  void update() {
    if (x > GlobalVars.screenWidth ||
        y > GlobalVars.screenHeight ||
        x < 0 ||
        y < 0) {
      visible = false;
    }
    move();
  }
}
