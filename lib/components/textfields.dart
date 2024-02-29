import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  final controller;
  final Icon prefixIcon;
  final String hintText;
  final bool obscureText;
  final keyboardType;
  final errorText;
  final String? Function(String?)? validator;
  const TextFields(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.prefixIcon,
      required this.keyboardType,
      this.validator,
      this.errorText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        style: const TextStyle(height: 1.0),
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.grey),
          prefixIcon: prefixIcon,
          iconColor: Colors.grey,
          prefixIconColor: Colors.grey,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.2)),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF006be9)),
          ),
          fillColor: Colors.white,
          filled: true,
          labelText: hintText,
          hintStyle:
              TextStyle(color: Colors.grey[500], fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
