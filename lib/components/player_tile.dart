import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/player.dart';
import '../routes/app_routes.dart';

class PlayerTile extends StatelessWidget {
  final Player player;
  final int tamanho;
  PlayerTile(this.player, this.tamanho);
  late double height;

  @override
  Widget build(BuildContext context) {
    if (tamanho == 1) {
      height = 1;
    }
    if (tamanho == 2) {
      height = 0.5;
    }
    if (tamanho == 3) {
      height = 0.34;
    }
    if (tamanho >= 4) {
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
                        Navigator.of(context).popAndPushNamed(
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
