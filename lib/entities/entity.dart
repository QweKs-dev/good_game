import 'package:flutter/cupertino.dart';

abstract class Entity{
  double x;
  double y;
  String spriteName;
  bool visible = true;
  List sprites = [];

  Entity(this.spriteName){
    for(int i = 0; i<4; i++){
      sprites.add(Image.asset('assets/$spriteName$i.png'));
    }
  }

  void update();
  void move();

  Widget build();
}