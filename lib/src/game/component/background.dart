import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';

import '../game.dart';

class Background extends SpriteComponent with HasGameRef<LearnFlameGame> {
  Background();

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load('background.png');
    size = gameRef.size;
    sprite = Sprite(background);
  }
}
