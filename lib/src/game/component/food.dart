import 'dart:async';
import 'dart:ui';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/services.dart';

import '../game.dart';
import 'cat.dart';

class Food extends SpriteComponent
    with HasGameRef<LearnFlameGame>, DragCallbacks, CollisionCallbacks {
  final String foodType;
  late Vector2 initialPosition;

  Food({
    required this.foodType,
    required Vector2 position,
  }) : super(position: position, size: Vector2(50, 50)) {
    initialPosition = position.clone();
  }

  @override
  Future<void> onLoad() async {
    final data = await rootBundle.load('packages/simple_game/assets/images/$foodType.png');
    final codec = await instantiateImageCodec(data.buffer.asUint8List());
    final frame = await codec.getNextFrame();
    size = size;
    position = position;
    sprite = Sprite(frame.image);
    add(CircleHitbox());
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position.add(event.localDelta);
  }

  @override
  void onDragEnd(DragEndEvent event) {
    super.onDragEnd(event);

    position = initialPosition.clone();
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Cat) {
      other.updateWeight(5);
      removeFromParent();
      print(gameRef.cat.weight);
    }
  }
}
