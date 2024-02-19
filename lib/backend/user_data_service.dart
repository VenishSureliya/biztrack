import 'package:biztrack/backend/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserDataService extends GetxController {
  Future<UserData?> getUserData() async {
    final String userID = FirebaseAuth.instance.currentUser!.uid;

    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('commercialUsers')
          .doc(userID)
          .get();
      if (doc.exists) {
        return UserData.fromSnapshot(doc);
      } else {
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }
}
