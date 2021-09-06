import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:good_game/entities/player.dart';
import 'package:good_game/game_core/main_loop.dart';
import 'package:good_game/utils/global_vars.dart';

class Game extends StatefulWidget {
  Game({Key key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  ReceivePort _receivePort;
  Isolate _isolate;

  void _startIsolateLoop() async{
    _receivePort = ReceivePort();
    _isolate = await Isolate.spawn(mainLoop, _receivePort.sendPort);
    _receivePort.listen((message) {
      GlobalVars.currentScene.update();
      setState(() {});
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
    _isolate.kill();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalVars.currentScene.buildScene();
  }
}