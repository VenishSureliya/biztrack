import 'package:biztrack/backend/auth_repo.dart';
import 'package:biztrack/backend/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final emailAddress = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  void registerUser(
      String emailAddress, password, firstName, lastName, phoneNumber) {
    AuthRepo.instance.createUserWithEmailAndPassword(emailAddress, password);
    UserRepo.instance.addUserDetails(
      firstName.text,
      lastName.text,
      phoneNumber.text,
    );

    loginUser(emailAddress, password);
  }

  void loginUser(String emailAddress, password) {
    AuthRepo.instance.loginUserWithEmailAndPassword(emailAddress, password);
  }

  void clearCredentials() async {
    AuthController.instance.emailAddress.clear();
    AuthController.instance.password.clear();
  }
}
