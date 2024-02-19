// ignore_for_file: avoid_print
import 'package:biztrack/pages/home_page.dart';
import 'package:biztrack/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static TextEditingController displayNameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  static final credentials = FirebaseAuth.instance;

  static void signUp(displayName) async {
    try {
      await credentials.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      AuthController.logIn(displayName);
      print("SINGUP SUCCESSFUL");
    } catch (exception) {
      print(exception);
    }
  }

  static void logIn(displayName) async {
    try {
      await credentials.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      print("SIGNIN SUCCESSFUL");

      Get.offAll(() => const HomePage());
    } catch (exception) {
      print(exception);
    }
  }

  static logOut() async {
    await FirebaseAuth.instance.signOut();
    emailController.clear();
    passwordController.clear();
    Get.offAll(() => LoginPage());
  }

  static clearCredentials() async {
    AuthController.emailController.clear();
    AuthController.passwordController.clear();
  }
}
