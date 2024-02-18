import 'package:flutter/material.dart';

class Snackbar extends StatelessWidget {
  final String snackMessage;
  const Snackbar({super.key, required this.snackMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SnackBar(
        content: Text(snackMessage),
      ),
    );
  }
}
