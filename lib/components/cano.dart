import 'dart:math';
import 'dart:ui';

import 'package:flame/components/animation_component.dart';
import 'package:flame/components/component.dart';
import 'package:flame/position.dart';
import 'package:flappy_bird/game.dart';
import 'package:flame/sprite.dart';


class Cano {
  final BirdGame game;
  bool start = true;
  Random rnd;
  Sprite canos;
  Rect rect;
  int cano = 0;
  Canvas c;
  Cano(this.game){
    rnd = Random();
    canos = Sprite('cano_topo.png');
    rect =  Rect.fromLTWH(game.screenSize.width-game.tileSize*1.5, 0, game.tileSize*1.5, game.tileSize*4);
  }

  void render(Canvas c) {
    this.c = c;
    canos.renderRect(c, rect);
  }
    void update(double t){
    if(rect.left<=-game.tileSize){
      cano = rnd.nextInt(2);
      switch(cano){
        case 0:
          canos = Sprite('cano_topo.png');
          rect =  Rect.fromLTWH(game.screenSize.width, 0, game.tileSize*1.5, game.tileSize*4);
          canos.renderRect(c, rect);
          break;
        case 1:
          canos = Sprite('cano_topo_maior.png');
          rect =  Rect.fromLTWH(game.screenSize.width, 0, game.tileSize*1.5, game.tileSize*6);
          canos.renderRect(c, rect);
          break;
      }
    }

    rect = rect.translate(-game.tileSize*3*t, 0);

  }
}
