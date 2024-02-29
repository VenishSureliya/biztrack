import 'package:biztrack/backend/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (currentUser != null) ...[
                Text("Hey ${currentUser.email}!"),
              ] else ...[
                const Text("Please sign in to access your information."),
              ],
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await AuthRepo.instance.logout();
                  },
                  child: const Text("Logout"))
            ],
          ),
        ),
      ),
    );
  }
}
