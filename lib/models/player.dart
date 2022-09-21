import 'package:flutter/widgets.dart';

class Player {
  final String id;
  final String name;
  late Color color;
  late int points;

  Player({
    required this.id,
    required this.name,
    required this.color,
    required this.points,
  });
}
