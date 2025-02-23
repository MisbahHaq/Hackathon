import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLogin = true.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void toggleForm() {
    isLogin.value = !isLogin.value;
  }

  Future<void> signUp(String name, String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.updateDisplayName(name);
      Get.snackbar("Success", "Account created successfully!");
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "Sign up failed");
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed('/Dashboard');
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "Login failed");
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
