import 'package:flutter/material.dart';

class ShowSnackbar extends StatelessWidget {
  final String snackMessage;
  const ShowSnackbar({super.key, required this.snackMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SnackBar(
        content: Text(snackMessage),
      ),
    );
  }
}
