import 'dart:async';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';

import '../game.dart';

class Cat extends SpriteComponent
    with CollisionCallbacks, HasGameRef<LearnFlameGame> {
  Cat();

  int weight = 5;

  @override
  Future<void> onLoad() async {
    final data =
        await rootBundle.load('packages/simple_game/assets/images/cat.png');
    final codec = await instantiateImageCodec(data.buffer.asUint8List());
    final frame = await codec.getNextFrame();
    sprite = Sprite(frame.image);

    size = Vector2(250, 300);
    position =
        Vector2(game.size.x / 2 - size.x / 2, game.size.y / 2 - size.y / 2);
    super.onLoad();
    super.onLoad();

    add(RectangleHitbox());
  }

  void updateWeight(int newWeight) {
    weight += newWeight;
  }
}
