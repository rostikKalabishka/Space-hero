import 'package:flutter/material.dart';

abstract class Entity {
  double x = 0;
  double y = 0;
  String spritename;
  bool visible = true;
  List sprites = [];

  Entity(this.spritename) {
    for (var i = 0; i < 4; i++) {
      sprites.add(Image.asset('assets/$spritename$i.png'));
    }
  }

  void update();
  void move();
  Widget build();
}
