import 'package:biztrack/backend/auth_controls.dart';
import 'package:biztrack/components/button.dart';
import 'package:biztrack/components/textfields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'register_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //TEXT EDITING CONTROLLERS
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //USER SIGN IN FUNCTION

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(
              //   height: 50,
              // ),

              //ICON
              const Text(
                "Biztrack",
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF006be9)),
              ),

              const SizedBox(
                height: 1,
              ),

              //INITIAL TEXT
              Text(
                "Welcome back, You've been missed!",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),

              const SizedBox(
                height: 30,
              ),

              //USERNAME TEXT FIELD
              TextFields(
                controller: AuthController.emailController,
                hintText: "Email",
                obscureText: false,
              ),

              const SizedBox(
                height: 10,
              ),

              //PASSWORD TEXT FIELD
              TextFields(
                controller: AuthController.passwordController,
                hintText: "Password",
                obscureText: true,
              ),

              const SizedBox(
                height: 10,
              ),

              //FORGOT PASSWORD TXT
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              //SIGN IN BUTTON
              Button(
                buttonText: "Login",
                onTap: () {
                  AuthController.logIn(AuthController.displayNameController.text);
                  // if (AuthController.emailController.text.isNotEmpty &&
                  //     AuthController.passwordController.text.length > 6) {

                  // } else {
                  //   debugPrint("LOG : Email is empty or Password is invalid");
                  // }
                },
              ),

              const SizedBox(
                height: 54,
              ),

              GestureDetector(
                onTap: () {
                  AuthController.clearCredentials();
                  Get.offAll(RegisterPage());
                },
                child: Text(
                  "New User? Register Here",
                  style: TextStyle(color: Colors.grey[600], fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
