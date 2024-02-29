import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();

  final dataBase = FirebaseFirestore.instance;

  Future addUserDetails(String firstName,String lastName,String phoneNumber) async {
    await FirebaseFirestore.instance.collection('commercialUsers').add({
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
    });
  }

  
}
