

import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/game.dart';

import 'components/background.dart';
import 'components/bird-fly.dart';
import 'components/cano.dart';
import 'components/game-over.dart';

class BirdGame extends BaseGame{
  Size screenSize;
  double tileSize;
  Fundo background;
  BirdFly bird;
  Cano cano;
  GameOver gameOver;

  BirdGame(){
    initialize();
  }

  void initialize()async{
    resize(await Flame.util.initialDimensions());

    background = Fundo(this);
    bird = BirdFly(this);
    cano = Cano(this);
    gameOver = GameOver(this);
  }


  @override
  void render(Canvas canvas) {
    background.render(canvas);
    bird.render(canvas);
    cano.render(canvas);
    gameOver.render(canvas);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }
  @override
  void update(double t) {
    bird.update(t);
    background.update(t);
    cano.update(t);
  }

  @override
  void onTapDown(TapDownDetails details) {
   bird.onTapDown();
   if(gameOver.gameOverRect.contains(details.globalPosition)){
     gameOver.onTapDown();
   }
   super.onTapDown(details);
  }
}