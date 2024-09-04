import 'package:black/services/auth/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../presentation/auth/log_in_screen.dart';
import '../../presentation/screens/home_screen.dart';

class AuthProvider extends ChangeNotifier {
  late UserCredential userCredential;

  signUp({required String email, required String password,required BuildContext context}) async {
    userCredential =
        await SignUpD.signUpwithEmail(email: email, password: password);
    notifyListeners();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LogInScreen()),
        (route) => false);
  }

  logIn({required String email, required String password, required BuildContext context}) async {
    userCredential =
        await SignUpD.logInwithEmail(email: email, password: password, );
    notifyListeners();
     Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false);
  }
}
