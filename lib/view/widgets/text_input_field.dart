import 'package:flutter/material.dart';
import 'package:tiktok/constants.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: ct,
      obscureText: nn,
      decoration: InputDecoration(
        labelText: lbtxt,
        prefixIcon: Icon(Icons.abc_outlined),
        labelStyle: TextStyle(
          fontSize: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
      ),
    );
  }
}
