import 'package:flutter/widgets.dart';

class Player {
  final String id;
  final String name;
  final Color color;
  final int points;

  const Player({
    required this.id,
    required this.name,
    required this.color,
    required this.points,
  });
}
