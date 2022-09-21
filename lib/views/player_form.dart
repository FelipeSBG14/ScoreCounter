import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../models/player.dart';
import '../provider/players.dart';
import 'dart:math' as math;

class PlayerForm extends StatelessWidget {
  PlayerForm({super.key});

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};
  final TextEditingController _controllerName = TextEditingController();

  void loadFormData(Player player) {
    if (player != null) {
      _formData['id'] = player.id;
      _formData['name'] = player.name;
      _formData['color'] = player.color;
      _formData['points'] = player.points;
      _controllerName.text = player.name;
    }
  }

  Widget build(BuildContext context) {
/*     final player = ModalRoute.of(context)!.settings.arguments as Player;
    loadFormData(player); */
    return Scaffold(
      appBar: AppBar(
        title: Text('Player Form'),
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
              children: [
                TextFormField(
                  initialValue: _formData['name'],
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nome invalido';
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['name'] = value,
                ),
              ],
            )),
      ),
    );
  }

  void addOrEdit(context) {
    final isValid = _form.currentState!.validate();
    if (isValid) {
      _form.currentState!.save();
      Provider.of<Players>(context, listen: false).put(
        Player(
          id: '', //teste
          name: _formData['name'],
          color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(1.0),
          points: 0,
        ),
      );
      Navigator.of(context).pop();
    }
  }
}
