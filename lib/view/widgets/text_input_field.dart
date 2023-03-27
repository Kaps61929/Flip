import 'package:flutter/material.dart';
import 'package:tiktok/constants.dart';

class TextInputField extends StatelessWidget {
  TextEditingController controller;
  final String labeltext;
  final bool isobscure;
  final IconData icon;
  TextInputField(
      {super.key,
      required this.controller,
      required this.labeltext,
      required this.isobscure,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isobscure,
      decoration: InputDecoration(
        labelText: labeltext,
        prefixIcon: Icon(icon),
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
