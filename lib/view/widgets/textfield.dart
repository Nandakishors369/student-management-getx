import 'package:flutter/material.dart';
import 'package:student_app_bloc/core/constants.dart';

class TextForm extends StatelessWidget {
  TextForm({Key? key, required this.Controller, required this.label})
      : super(key: key);

  final TextEditingController Controller;
  String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: kListStyle,
      controller: Controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: kListStyle,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: kztext),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: kztext,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Field is required';
        }

        return null;
      },
    );
  }
}
