import 'dart:ui';

import 'package:flame/sprite.dart';
import 'fly.dart';
import 'package:flappy_bird/game.dart';


class BirdFly extends Fly{
  BirdFly(BirdGame game) : super(game){
    flyRect = Rect.fromLTWH(game.screenSize.width*0.5-game.tileSize*0.5, game.screenSize.height*0.5-game.tileSize, game.tileSize, game.tileSize);
    flyingSprite = List();
    flyingSprite.add(Sprite('passaro1.png'));
    flyingSprite.add(Sprite('passaro2.png'));
    flyingSprite.add(Sprite('passaro3.png'));
  }
}