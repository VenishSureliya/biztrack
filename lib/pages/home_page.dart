import 'package:biztrack/backend/auth_controls.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Home Screen"),
              ElevatedButton(
                  onPressed: () async {
                    await AuthController.credentials.signOut();
                  },
                  child: const Text("Logout"))
            ],
          ),
        ),
      ),
    );
  }
}
