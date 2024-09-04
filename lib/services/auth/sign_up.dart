import 'package:firebase_auth/firebase_auth.dart';

class SignUpD {
  static Future<UserCredential> signUpwithEmail(
      {required String email, required String password}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential;
  }

  static Future<UserCredential> logInwithEmail(
      {required String email, required String password}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final userCredential = await auth.signInWithEmailAndPassword(
        email: email, password: password);
    return userCredential;
  }
}

