import 'dart:math';

import 'package:flutter/material.dart';
import '../models/player.dart';

class Players with ChangeNotifier {
  final Map<String, Player> _items = {};

  List<Player> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Player byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Player player) {
    if (player == null) {
      return;
    }

    if (player.id != null &&
        player.id.trim().isNotEmpty &&
        _items.containsKey(player.id)) {
      _items.update(
        player.id,
        (_) => Player(
          id: player.id,
          name: player.name,
          color: player.color,
          points: player.points,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Player(
          id: id,
          color: player.color,
          name: player.name,
          points: player.points,
        ),
      );
    }
    notifyListeners();
  }

  void remove(Player player) {
    if (player != null && player.id != null) {
      _items.remove(player.id);
      notifyListeners();
    }
  }
}
