import 'package:biztrack/backend/auth_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final currentUser = FirebaseAuth.instance.currentUser;
  final displayName = FirebaseAuth.instance.currentUser?.displayName;

  @override
  void initState() {
    super.initState();
    getFirstName();
  }

  Future<String> getFirstName() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return ""; // Handle case where user is not logged in
    }

    final docSnapshot = await FirebaseFirestore.instance
        .collection('commercialUsers')
        .doc(user.uid)
        .get();

    if (docSnapshot.exists) {
      final data = docSnapshot.data();
      if (data != null) {
        return data['firstName'] as String;
      }
    }
    return ""; // Handle case where user data is not found
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (FirebaseAuth.instance.currentUser != null)
                Text(
                  "Hello,  ${currentUser?.email}",
                  style: const TextStyle(fontSize: 20),
                ),
              const SizedBox(height: 10),
              if (FirebaseAuth.instance.currentUser == null)
                const Text(
                  "Please sign in to access your information.",
                  style: TextStyle(fontSize: 16),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await AuthRepo.instance.logout();
                  // Optionally, navigate to a login page/screen
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
