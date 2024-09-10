import 'package:black/services/auth/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final _fireStore = FirebaseFirestore.instance;

  static Future<UserCredential> signUpwithEmail(
      {required String email, required String password}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    final userData = {
      'email': userCredential.user?.email,
      'password': password,
      'uid': userCredential.user?.uid,
    };

    await _fireStore
        .collection(FirestoreCollections.users)
        .doc(userCredential.user?.uid)
        .set(userData);

    await _fireStore
        .collection(FirestoreCollections.cart)
        .doc(userCredential.user?.uid)
        .set({});

    return userCredential;
  }

  static Future<UserCredential> logInwithEmail(
      {required String email, required String password}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }
}
