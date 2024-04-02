import "package:biztrack/backend/auth_controls.dart";
import "package:biztrack/backend/form_validation.dart";
import "package:biztrack/components/button.dart";
import "package:biztrack/components/textfields.dart";
import "package:biztrack/pages/login_page.dart";
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




  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title and initial text
                  const Text(
                    "Biztrack",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF006be9),
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    "Streamlining your experience!",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // User information fields with validation
                  TextFields(
                    keyboardType: TextInputType.name,
                    controller: AuthController.instance.firstName,
                    prefixIcon: const Icon(Icons.first_page),
                    hintText: "First name",
                    obscureText: false,
                    validator: (value) => FormValidation.validateName(
                        value), // Add validation functions
                  ),
                  const SizedBox(height: 10),
                  TextFields(
                    errorText: "Incorrect Input",
                    keyboardType: TextInputType.name,
                    controller: AuthController.instance.lastName,
                    prefixIcon: const Icon(Icons.last_page),
                    hintText: "Last name",
                    obscureText: false,
                    validator: (value) => FormValidation.validateName(value),
                  ),
                  const SizedBox(height: 10),
                  TextFields(
                    keyboardType: TextInputType.number,
                    controller: AuthController.instance.phoneNumber,
                    prefixIcon: const Icon(Icons.numbers),
                    hintText: "Phone number",
                    obscureText: false,
                    validator: (value) =>
                        FormValidation.validatePhoneNumber(value),
                  ),
                  const SizedBox(height: 10),
                  TextFields(
                    keyboardType: TextInputType.emailAddress,
                    controller: AuthController.instance.emailAddress,
                    prefixIcon: const Icon(Icons.email_outlined),
                    hintText: "Email address",
                    obscureText: false,
                    validator: (value) =>
                        FormValidation.validateEmailAddress(value),
                  ),
                  const SizedBox(height: 10),
                  TextFields(
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(Icons.lock_outline),
                    controller: AuthController.instance.password,
                    hintText: "Password",
                    obscureText: true,
                    validator: (value) =>
                        FormValidation.validatePassword(value),
                  ),
                  const SizedBox(height: 30),

                  // Register button with form validation
                  Button(
                    buttonText: "Register",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        String firstName =
                            AuthController.instance.firstName.text;
                        String lastName = AuthController.instance.lastName.text;
                        String emailAddress =
                            AuthController.instance.emailAddress.text;
                        String phoneNumber =
                            AuthController.instance.phoneNumber.text;
                        String password = AuthController.instance.password.text;
                        AuthController.instance.registerUser(emailAddress,
                            password, firstName, lastName, phoneNumber);
                      }
                    },
                  ),
                  const SizedBox(height: 54),

                  GestureDetector(
                onTap: () {
                  // AuthController.clearCredentials();
                  Get.offAll(LoginPage());
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
        ),
      ),
    );
  }
}
