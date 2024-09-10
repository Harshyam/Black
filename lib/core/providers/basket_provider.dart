import 'package:black/domain/productModel.dart';
import 'package:black/services/auth/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class BasketProvider extends ChangeNotifier {
  List<ProductModel> basketProducts = [];
  bool isLoading = false;

  void setLoading(bool val) {
    isLoading = val;
  }

  Future<void> getBasketProducts() async {
    setLoading(true);
    final firestore = FirebaseFirestore.instance;
    final uid = FirebaseAuth.instance.currentUser?.uid;
    basketProducts = [];
    final data =
        await firestore.collection(FirestoreCollections.cart).doc(uid).get();
    final productsList = await data.data()?['products'];
    for (var p in productsList) {
      basketProducts.add(
        ProductModel.fromJson(p),
      );
    }
    setLoading(false);
    notifyListeners();
  }
}
