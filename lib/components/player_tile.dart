import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../models/player.dart';
import '../provider/players.dart';
import '../routes/app_routes.dart';

class PlayerTile extends StatefulWidget {
  final Player player;

  PlayerTile(this.player);

  @override
  State<PlayerTile> createState() => _PlayerTileState();
}

class _PlayerTileState extends State<PlayerTile> {
  late double height = 0;

  @override
  Widget build(BuildContext context) {
    final Players players = Provider.of(
      context,
    );

    if (players.count == 1) {
      height = 0.9;
    }
    if (players.count == 2) {
      height = 0.45;
    }
    if (players.count == 3) {
      height = 0.3;
    }
    if (players.count >= 4) {
      height = 0.23;
    }

    return SizedBox(
      child: InkWell(
        onLongPress: () {
          showDialog(
            barrierDismissible: true,
            context: context,
            builder: (BuildContext context) {
              // retorna um objeto do tipo Dialog
              return AlertDialog(
                title: Text('Jogador ' + widget.player.name + widget.player.id),
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
                            arguments: widget.player,
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
          color: widget.player.color,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        widget.player.name,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            shadows: [
                              Shadow(
                                  blurRadius: 2,
                                  color: Colors.black,
                                  offset: Offset.zero),
                            ]),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Colors.grey,
                  ),
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          color: Colors.white,
                        ),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                widget.player.points -= 1;
                              });
                            },
                            icon: Icon(
                              Icons.remove,
                              color: Colors.black,
                            )),
                      ),
                      Text(
                        '${widget.player.points}',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          color: Colors.white,
                        ),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                widget.player.points += 1;
                              });
                            },
                            icon: Icon(
                              Icons.add,
                              color: Colors.black,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
