import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_count/components/custom_form_field.dart';
import 'package:score_count/routes/app_routes.dart';
import 'package:score_count/ui/fonts/app_fonts.dart';
import '../models/player.dart';
import '../provider/players.dart';
import 'dart:math' as math;

class PlayerForm extends StatefulWidget {
  const PlayerForm({super.key});

  @override
  State<PlayerForm> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PlayerForm> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};
  final TextEditingController _controllerName = TextEditingController();

  void editPlayer(Player? player) {
    if (player != null) {
      _formData['id'] = player.id;
      _formData['name'] = player.name;
      _formData['color'] = player.color;
      _formData['points'] = player.points;
    }
  }

/*   @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Player player = ModalRoute.of(context)!.settings.arguments as Player;
    editPlayer(player);
  } */

  @override
  Widget build(BuildContext context) {
    final Player? player =
        ModalRoute.of(context)?.settings.arguments as Player?;
    editPlayer(player);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Adicione um jogador',
          style:
              AppFonts.primaryFont(MediaQuery.of(context).size.height * 0.020),
        ),
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => addOrEdit(context),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
            key: _form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  initialValue: _formData['name'],
                  decoration: const InputDecoration(
                    labelText: 'Nome do Jogador / Equipe',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            25,
                          ),
                        ),
                        borderSide: BorderSide(color: Colors.orange, width: 4)),
                  ),
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Coloque o nome de um jogador';
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['name'] = value,
                  onFieldSubmitted: (_) => addOrEdit(context),
                ),
                // CustomFormField(
                //   formData: _formData['name'],
                //   label: 'Nome do Jogador / Equipe',
                //   onSaved: (value) => _formData['name'] = value,
                //   onSubmit: (_) => addOrEdit(context),
                // ),
              ],
            )),
      ),
    );
  }

  void addOrEdit(context) {
    final isValid = _form.currentState!.validate();
    if (isValid) {
      _form.currentState?.save();
      Provider.of<Players>(context, listen: false).put(
        Player(
          id: _formData['id'], //teste
          name: _formData['name'],
          color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(1.0),
          points: 0,
          firstPoint: false,
        ),
      );
      Navigator.popAndPushNamed(context, AppRoutes.PLAYERS_LIST);
    }
  }
}
