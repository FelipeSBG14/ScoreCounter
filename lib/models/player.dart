import 'package:flutter/widgets.dart';

class Player {
  String id;
  String name;
  late Color color;
  late int points;

  Player({
    required this.id,
    required this.name,
    required this.color,
    required this.points,
  });
}
