import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DataFetching extends GetxController {
  static getFirstName(String uid) async {
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
}
