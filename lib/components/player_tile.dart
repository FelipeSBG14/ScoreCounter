import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../models/player.dart';
import '../provider/players.dart';
import '../routes/app_routes.dart';

class PlayerTile extends StatelessWidget {
  final Player player;

  PlayerTile(this.player);
  late double height = 0;
  @override
  Widget build(BuildContext context) {
    final Players players = Provider.of(
      context,
    );

    if (players.count == 1) {
      height = 1;
    }
    if (players.count == 2) {
      height = 0.5;
    }
    if (players.count == 3) {
      height = 0.3;
    }
    if (players.count >= 4) {
      height = 0.23;
    }

    return InkWell(
      onLongPress: () {
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) {
            // retorna um objeto do tipo Dialog
            return AlertDialog(
              title: Text('Jogador ' + player.name),
              content: Text("Deseja deletar ou editar esse jogador ?"),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      child: Text("Editar"),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          AppRoutes.PLAYER_FORM,
                          arguments: player,
                        );
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      child: Text("Deletar"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                )
              ],
            );
          },
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * height,
        color: player.color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              player.name,
              style: TextStyle(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      print('Mais um ponto pro ${player.name}' +
                          '${player.points}');
                    },
                    icon: Icon(
                      Icons.remove,
                      color: Colors.white,
                    )),
                Text(
                  '${player.points}',
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.PLAYER_FORM,
                        arguments: player,
                      );
                    },
                    icon: Icon(Icons.edit))
              ],
            )
          ],
        ),
      ),
    );
  }
}
