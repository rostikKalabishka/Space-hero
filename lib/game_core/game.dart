import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:space_hero/game_core/main_loop.dart';

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
  Isolate? _isolateLoop;
  void startIsolateLoop() async {
    _receivePort = ReceivePort();
    _isolateLoop = await Isolate.spawn(mainLoop, _receivePort.sendPort);
    _receivePort.listen((message) {
      setState(() {
        x++;
        if (x > 600) {
          x = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isFirstStartGame) {
      startIsolateLoop();
      isFirstStartGame = false;
    }
    return Stack(
      children: [
        Positioned(top: y, left: x, child: Text('Data2')),
      ],
    );
  }
}
