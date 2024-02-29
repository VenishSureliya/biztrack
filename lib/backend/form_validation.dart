import 'package:flutter/material.dart';

class FormValidation extends StatelessWidget {
  const FormValidation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  static String? validateEmailAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email address is required.';
    } else if (!RegExp(r'^.+@[a-zA-Z]+\.[a-zA-Z]+$').hasMatch(value)) {
      return 'Invalid email format.';
    } else {
      return null; 
    }
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required.';
    } else if (value.length < 1) {
      return 'Name must be at least one character long.';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    } else if (value.length < 10) {
      return 'Phone number must be at least 10 digits long.';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Phone number must contain only digits.';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required.';
  } else if (value.length < 8) {
    return 'Password must be at least 8 characters long.';
  } else if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
    return 'Password must contain at least one letter.';
  } else if (!RegExp(r'[0-9]').hasMatch(value)) {
    return 'Password must contain at least one digit.';
  } else if (!RegExp(r'[^a-zA-Z0-9]').hasMatch(value)) {
    return 'Password must contain at least one special character.';
  } else {

    return null;
  }
}

}
