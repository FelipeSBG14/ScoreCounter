import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../models/player.dart';
import '../provider/players.dart';

class PlayerForm extends StatelessWidget {
  
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


  @override void didChangeDependencies() {
    super.didChangeDependencies();
  }
  
  Widget build(BuildContext context) {

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
          id: '',
          name: _formData['name'],
          color: Colors.black,
          points: 3,
        ),
      );
      Navigator.of(context).pop();
    }
  }
}
