import 'package:biztrack/backend/auth_repo.dart';
import 'package:biztrack/pages/add_item_page.dart';
import 'package:biztrack/pages/edit_item_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

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
                ElevatedButton(
                  onPressed: () {
                    // Navigate to add item page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddItemPage()));
                  },
                  child: const Text("Add Item"),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to edit item page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditItemPage()));
                  },
                  child: const Text("Edit Item"),
                ),
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
                child: const Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

