import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:score_count/components/player_tile.dart';
import 'package:score_count/data/dummy_players.dart';
import 'package:score_count/models/player.dart';
import 'package:score_count/routes/app_routes.dart';

import '../provider/players.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class PlayerList extends StatefulWidget {
  @override
  State<PlayerList> createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  String _selectedMenu = '';

  @override
  Widget build(BuildContext context) {
    final Players players = Provider.of(
      context,
    );
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            title: Text('Marcador de Pontos'),
            actions: <Widget>[
              // This button presents popup menu items.
              PopupMenuButton<Menu>(
                  // Callback that sets the selected popup menu item.
                  onSelected: (Menu item) {
                    if (item == Menu.itemTwo) {
                      Navigator.of(context).pushNamed(AppRoutes.PLAYER_FORM);
                    }
                    if (item == Menu.itemOne) {
                      players.items.forEach((key, players) {
                        players.points = 0;
                      });
                    }
                    setState(() {
                      _selectedMenu = item.name;
                    });
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                        const PopupMenuItem<Menu>(
                          value: Menu.itemOne,
                          child: Text('Zerar pontos'),
                        ),
                        const PopupMenuItem<Menu>(
                          value: Menu.itemTwo,
                          child: Text('Adicionar jogador'),
                        ),
                      ]),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLAYER_FORM);
            },
            child: Icon(Icons.add),
          ),
          body: players.count == 0
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Nenhum jogador adicionado :(')],
                  ),
                )
              : players.count > 4
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 1,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0),
                      itemCount: players.count,
                      itemBuilder: (ctx, i) => PlayerTile(players.byIndex(i)),
                    )
                  : ListView.builder(
                      itemCount: players.count,
                      itemBuilder: (ctx, i) => PlayerTile(players.byIndex(i)),
                    )),
    );
  }
}
