import "package:biztrack/backend/auth_controls.dart";
import "package:biztrack/components/button.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  //TEXT EDITING CONTROLLERS
  final firstNameController = AuthController.instance.firstName;
  final lastNameController = AuthController.instance.lastName;
  final emailController = AuthController.instance.emailAddress;
  final passwordController = AuthController.instance.password;
  final phoneNumberController = AuthController.instance.phoneNumber;

  //USER SIGN IN FUNCTION
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Form(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: AuthController.instance.firstName,
                decoration: const InputDecoration(
                  label: Text("First Name"),
                  // prefixIcon: Icon(Icons.person_outline_rounded),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: AuthController.instance.lastName,
                decoration: const InputDecoration(
                  label: Text("Last Name"),
                  // prefixIcon: Icon(Icons.person_outline_rounded),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: AuthController.instance.emailAddress,
                decoration: const InputDecoration(
                    label: Text("Email Address"),
                    prefixIcon: Icon(Icons.email_outlined)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: AuthController.instance.phoneNumber,
                decoration: const InputDecoration(
                    label: Text("Phone Number"),
                    prefixIcon: Icon(Icons.numbers)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: AuthController.instance.password,
                decoration: const InputDecoration(
                    label: Text("Password"),
                    prefixIcon: Icon(Icons.fingerprint)),
              ),
              const SizedBox(
                height: 10,
              ),
              Button(
                  onTap: () {
                    // AuthController.instance.registerUser(firstName: 
                    //     emailController.text, passwordController.text);
                  },
                  buttonText: "Register")
            ],
          )),
        ),
      ),
    );
  }
}
