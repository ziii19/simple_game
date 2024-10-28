import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'component/cat.dart';
import 'component/food.dart';

class LearnFlameGame extends FlameGame with HasCollisionDetection {
  late final Paint paint;
  late final Cat cat;
  final List<Food> foodItems = [];
  late TextComponent catHeight;

  @override
  Future<void> onLoad() async {
    paint = Paint()..color = Colors.blue;

    cat = Cat();

    foodItems.addAll([
      Food(foodType: 'food1', position: Vector2(50, size.y - 100)),
      Food(foodType: 'food2', position: Vector2(150, size.y - 100)),
      Food(foodType: 'food3', position: Vector2(250, size.y - 100)),
      Food(foodType: 'food4', position: Vector2(350, size.y - 100)),
    ]);

    addAll([
      cat,
      ...foodItems,
      catHeight = buildCatHeight(),
    ]);

    super.onLoad();
  }

  TextComponent buildCatHeight() {
    return TextComponent(
        position: Vector2(size.x / 2, size.y / 2 * 0.2),
        anchor: Anchor.center,
        textRenderer: TextPaint(
          style: const TextStyle(
              fontSize: 40, fontFamily: 'Game', fontWeight: FontWeight.bold),
        ));
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.x, size.y),
      paint,
    );

    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
    catHeight.text = 'Weight: ${cat.weight}';
  }
}
