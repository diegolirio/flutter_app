import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Edit extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType textInputType;

  Edit({this.controller, this.label, this.hint, this.icon, this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: this.controller,
        style: TextStyle(
          fontSize: 24,
        ),
        decoration: InputDecoration(
          labelText: this.label,
          hintText: this.hint,
          icon: this.icon != null ? Icon(this.icon) : null,
        ),
        keyboardType: this.textInputType,
      ),
    );
  }
}
