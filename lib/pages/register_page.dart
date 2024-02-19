import "package:biztrack/backend/auth_controls.dart";
import "package:biztrack/components/button.dart";
import "package:biztrack/components/textfields.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  //TEXT EDITING CONTROLLERS
  final displaNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //USER SIGN IN FUNCTION
  void signUserIn() {}

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
                "Streamlise your interaction of inventory!",
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
                controller: AuthController.displayNameController,
                hintText: "Enter username",
                obscureText: false,
              ),

              const SizedBox(
                height: 10,
              ),

              //USERNAME TEXT FIELD
              TextFields(
                controller: AuthController.emailController,
                hintText: "Enter email address",
                obscureText: false,
              ),

              const SizedBox(
                height: 10,
              ),

              //PASSWORD TEXT FIELD
              TextFields(
                controller: AuthController.passwordController,
                hintText: "Create new password",
                obscureText: true,
              ),

              const SizedBox(
                height: 10,
              ),

              //PASSWORD TEXT FIELD
              TextFields(
                controller: AuthController.passwordController,
                hintText: "Verify password",
                obscureText: false,
              ),

              const SizedBox(
                height: 10,
              ),

              //FORGOT PASSWORD TXT
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       Text(
              //         "Forgot Password?",
              //         style: TextStyle(
              //           color: Colors.grey[600],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              const SizedBox(
                height: 30,
              ),

              //SIGN IN BUTTON
              Button(
                buttonText: "Register",
                onTap: () {
                  AuthController.signUp(AuthController.displayNameController);
                  // final authenticate = FirebaseAuth.instance;
                  // authenticate.createUserWithEmailAndPassword(
                  //     email: emailController.text,
                  //     password: passwordController.text);
                },
              ),

              const SizedBox(
                height: 24,
              ),

              GestureDetector(
                onTap: () {
                  Get.offAll(LoginPage());
                },
                child: Text(
                  "Already a user? Log In",
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
