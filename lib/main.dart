import 'package:biztrack/backend/auth_controls.dart';
import 'package:biztrack/backend/auth_repo.dart';
import 'package:biztrack/backend/user_repo.dart';
import 'package:biztrack/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthRepo()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    Get.put(UserRepo());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
      theme: ThemeData(
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: Color(0xFF006be9))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

