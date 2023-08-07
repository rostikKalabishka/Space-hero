import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:space_hero/entites/player.dart';
import 'package:space_hero/game_core/main_loop.dart';
import 'package:space_hero/utilits/global_vars.dart';

import '../utilits/common_vars.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  double x = 150;
  double y = 200;

  late ReceivePort _receivePort;
  late Isolate _isolateLoop;

  void _startIsolateLoop() async {
    _receivePort = ReceivePort();
    _isolateLoop = await Isolate.spawn(mainLoop, _receivePort.sendPort);
    _receivePort.listen((message) {
      setState(() {
        GlobalVars.currentScene.update();
      });
    });
  }

  @override
  void initState() {
    _startIsolateLoop();

    super.initState();
  }

  @override
  void dispose() {
    _receivePort.close();
    _isolateLoop.kill();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalVars.currentScene.buildScene();
  }
}
