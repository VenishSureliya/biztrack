import 'package:biztrack/backend/auth_controls.dart';
import 'package:biztrack/exception/authentication_exceptions.dart';
import 'package:biztrack/pages/home_page.dart';
import 'package:biztrack/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthRepo extends GetxController {
  static AuthRepo get instance => Get.find();

  //Variables
  final authenticate = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(authenticate.currentUser);
    firebaseUser.bindStream(authenticate.userChanges());
    ever(firebaseUser, setInitialPage);
  }

  setInitialPage(User? user) {
    user == null
        ? Get.offAll(() => LoginPage())
        : Get.offAll(() => const HomePage());
  }

  Future<void> createUserWithEmailAndPassword(String email, password) async {
    try {
      await authenticate.createUserWithEmailAndPassword(
          email: email, password: password);
          firebaseUser.value != null ? Get.offAll(() => HomePage()) : Get.to(() => LoginPage())?.then((value) => AuthController.instance.clearCredentials());
    } on FirebaseAuthException catch (e) {
      final exception = AuthenticationExceptions.code(e.code);
      print('FIREBASE AUTH EXCEPTION -  ${exception.message}');
      throw exception;
    } catch (_) {
      const exception = AuthenticationExceptions();
      print("EXCEPTION - ${exception.message}");
      throw exception;
    }
  }

  Future<void> loginUserWithEmailAndPassword(String email, password) async {
    try {
      await authenticate.signInWithEmailAndPassword(
          email: AuthController.instance.emailAddress.text, password: AuthController.instance.password.text).then((value) => AuthController.instance.clearCredentials());
      
    } on FirebaseAuthException catch (exception) {
    } catch (_) {}
  }

  Future<void> logout() async => await authenticate.signOut();
}
