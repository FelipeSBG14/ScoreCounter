// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String? formData;
  final String label;
  final void Function(String?) onSaved;
  final void Function(String?) onSubmit;
  const CustomFormField({
    Key? key,
    required this.formData,
    required this.label,
    required this.onSaved,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: formData,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(
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
      onSaved: onSaved,
      onFieldSubmitted: (_) => onSubmit,
    );
  }
}
