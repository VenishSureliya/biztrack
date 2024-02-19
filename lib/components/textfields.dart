import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  final controller;
  final Icon prefixIcon;
  final String hintText;
  final bool obscureText;

  const TextFields(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        style: const TextStyle(height: 1.0),
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.2)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey)),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle:
              TextStyle(color: Colors.grey[500], fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
