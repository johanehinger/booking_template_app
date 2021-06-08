import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final Icon icon;
  final bool obscureText;
  final String labelText;
  TextInput({
    required this.icon,
    required this.obscureText,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      padding: const EdgeInsets.only(
        top: 12.0,
        left: 12.0,
        right: 12.0,
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: icon,
          border: const OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(12.0),
            ),
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}
