import 'dart:async';
import 'dart:ui';
import 'package:flappy_bird/game.dart';
import 'package:flame/sprite.dart';


class GameOver {
  final BirdGame game;
  Sprite gameOverSprite;
  Rect gameOverRect;

  GameOver(this.game){
    gameOverSprite = Sprite('game_over.png');
    gameOverRect = Rect.fromLTWH(game.tileSize*0.5, game.screenSize.height*0.5-game.tileSize, game.tileSize*8, game.tileSize*1.74);
  }
  void render(Canvas c){
    if(game.bird.flyRect.top <= 0.0 || game.bird.flyRect.top >= game.screenSize.height-game.tileSize || game.bird.flyRect.overlaps(game.cano.rect)){
      gameOverSprite.renderRect(c, gameOverRect);
    }
  }
    void onTapDown(){
    game.bird.flyRect =  Rect.fromLTWH(game.screenSize.width*0.5-game.tileSize*0.5, game.screenSize.height*0.5-game.tileSize, game.tileSize, game.tileSize);
    game.bird.scrrenTap = false;
  }
}