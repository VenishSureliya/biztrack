// ignore_for_file: avoid_print

import 'package:biztrack/components/show_snackbar.dart';
import 'package:biztrack/pages/home_page.dart';
import 'package:biztrack/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  static final credentials = FirebaseAuth.instance;

  static void signUp() async {
    try {
      await credentials.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Get.offAll(() => LoginPage());
      print("SINGUP SUCCESSFUL");
    } catch (exception) {
      print(exception);
    }
  }

  static void logIn() async {
    try {
      await credentials.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      print("SIGNIN SUCCESSFUL");
      const ShowSnackbar(snackMessage: "Signed in successfully");
      Get.offAll(() => const HomePage());
    } catch (exception) {
      print(exception);
    }
  }

  static logOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => LoginPage());
  }
}
