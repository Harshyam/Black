import 'package:black/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../presentation/auth_screens/log_in_screen.dart';
import '../../presentation/screens/home_screen.dart';

class AuthProvider extends ChangeNotifier {
  late UserCredential userCredential;

  signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    userCredential =
        await AuthService.signUpwithEmail(email: email, password: password);
    notifyListeners();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LogInScreen()),
        (route) => false);
  }

  Future<void> logIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    userCredential = await AuthService.logInwithEmail(
      email: email,
      password: password,
    );
    notifyListeners();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false);
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (!context.mounted) return;
    await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LogInScreen(),
      ),
      (_) => false,
    );
  }
}
