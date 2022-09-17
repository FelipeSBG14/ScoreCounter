import 'package:flutter/widgets.dart';

class Player {
  final String id;
  final String name;
  final Color color;
  final int points = 0;

  const Player({
    required this.id,
    required this.name,
    required this.color,
  });
}
