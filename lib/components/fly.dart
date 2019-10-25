import 'dart:ui';
import 'package:flappy_bird/game.dart';
import 'package:flame/sprite.dart';

class Fly {
  final BirdGame game;
  List<Sprite> flyingSprite;
  double flyingSpriteIndex = 0;
  Rect flyRect;
  double tempo = 0;
  bool scrrenTap = false;
  double get speed => game.tileSize * 6;
  Fly(this.game);

  void render(Canvas c){
    flyingSprite[flyingSpriteIndex.toInt()].renderRect(c,flyRect);
  }

  void update(double t){
    if(scrrenTap){
      if(flyRect.top > 0.0){
        if(game.bird.flyRect.top >= game.screenSize.height-game.tileSize){
          Offset offset = Offset(0,0);
          flyRect = flyRect.shift(offset);
        }else{
          Offset offset = Offset(0,(-speed*t*1.5)+(speed*tempo));
          flyRect = flyRect.shift(offset);
          tempo +=t/10;
        }
      }else{
        Offset offset = Offset(0,0);
        flyRect = flyRect.shift(offset);
      }
  }
    flyingSpriteIndex += 6*t;
    if(flyingSpriteIndex>=3){
      flyingSpriteIndex -=3;
    }
  }
  void onTapDown(){
    scrrenTap = true;
    tempo = 0;
  }

}