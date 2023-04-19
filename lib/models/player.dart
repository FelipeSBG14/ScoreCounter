import 'package:flutter/widgets.dart';

class Player {
  String? id;
  final String name;
  final Color color;
  late int points;
  late bool firstPoint;

  Player({
    this.id,
    required this.name,
    required this.color,
    required this.points,
    required this.firstPoint,
  });
}
