import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:score_count/components/player_tile.dart';
import 'package:score_count/data/dummy_players.dart';
import 'package:score_count/models/player.dart';
import 'package:score_count/routes/app_routes.dart';

import '../provider/players.dart';

class PlayerList extends StatelessWidget {
  const PlayerList({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final Players players = Provider.of(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Marcador de Pontos'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.PLAYER_FORM);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: players.count == 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Nenhum jogador adicionado :(')],
              ),
            )
          : ListView.builder(
              itemCount: players.count,
              itemBuilder: (ctx, i) => PlayerTile(players.byIndex(i)),
            ),
    );
  }
}
