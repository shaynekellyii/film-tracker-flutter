import 'package:flutter/material.dart';

class BlackFormField extends StatelessWidget {
  const BlackFormField({
    Key key,
    @required this.icon,
    @required this.label,
    this.keyboardType,
    this.onSaved,
    this.controller,
  });

  final IconData icon;
  final String label;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          fillColor: Colors.black,
          icon: Icon(icon, color: Colors.grey),
          labelText: label,
          labelStyle: TextStyle(color: Colors.black)),
      keyboardType: keyboardType,
      onSaved: onSaved,
      style: TextStyle(color: Colors.black),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
      },
    );
  }
}
