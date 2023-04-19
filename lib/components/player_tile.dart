import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:score_count/ui/fonts/app_fonts.dart';

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
    DateTime now = DateTime.now();
    String hour = DateFormat('mm:ss').format(now);

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
                title: Text(
                  'Jogador ${widget.player.name}',
                  style: AppFonts.primaryFont(
                      MediaQuery.of(context).size.height * 0.025),
                ),
                content: Text(
                  "Deseja deletar ou editar esse jogador ?",
                  style: AppFonts.secundaryFont(
                      MediaQuery.of(context).size.height * 0.020),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: const Text("Editar"),
                        onPressed: () {
                          Navigator.of(context).popAndPushNamed(
                            AppRoutes.PLAYER_FORM,
                            arguments: widget.player,
                          );
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: const Text("Deletar"),
                        onPressed: () {
                          Provider.of<Players>(
                            context,
                            listen: false,
                          ).remove(widget.player);
                          Navigator.pop(context);
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
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        widget.player.name,
                        style: AppFonts.primaryFont(
                            MediaQuery.of(context).size.height * 0.030),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Colors.grey,
                  ),
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          color: Colors.white,
                        ),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                widget.player.points -= 1;
                                widget.player.firstPoint = true;
                              });
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.black,
                            )),
                      ),
                      Text(
                        '${widget.player.points}',
                        style: AppFonts.pointsFont(
                            MediaQuery.of(context).size.height * 0.030),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          color: Colors.white,
                        ),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                widget.player.points += 1;
                                widget.player.firstPoint = true;
                              });
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: widget.player.firstPoint,
                  child: Text(
                    hour,
                    style: AppFonts.pointsFont(
                        MediaQuery.of(context).size.height * 0.015),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
