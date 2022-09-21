import 'dart:math';

import 'package:flutter/material.dart';
import 'package:score_count/data/dummy_players.dart';
import '../models/player.dart';

class Players with ChangeNotifier {
  late Map<String, Player> items = {};


  List<Player> get all {
    return [...items.values];
  }

  int get count {
    return items.length;
  }

  Player byIndex(int i) {
    return items.values.elementAt(i);
  }

  void put(Player player) {
    if (player == null) {
      return;
    }

    if (player.id != null &&
        player.id.trim().isNotEmpty &&
        items.containsKey(player.id)) {
      items.update(
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
      items.putIfAbsent(
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
      items.remove(player.id);

      notifyListeners();
    }
    
  }

  
}
