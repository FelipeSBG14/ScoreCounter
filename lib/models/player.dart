import 'package:flutter/widgets.dart';

class Player {
  String? id;
  final String name;
  final Color color;
  late int points;

 Player({
    this.id,
    required this.name,
    required this.color,
    required this.points,
  });
}
