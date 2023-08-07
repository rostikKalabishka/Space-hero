import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:space_hero/entites/entity.dart';

class Player extends Entity {
  Player() : super('player') {
    x = 50;
    y = 150;
  }

  @override
  Widget build() {
    return Positioned(
        top: y, left: x, child: visible ? sprites.first : SizedBox());
  }

  @override
  void move() {
    x++;
    if (x > 600) {
      x = 50;
    }
  }

  @override
  void update() {
    move();
  }
}
