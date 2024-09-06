import 'package:black/domain/category_model.dart';
import 'package:black/domain/productModel.dart';
import 'package:black/services/auth/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiCalling {
  static Future<List<ProductModel>> loadApiData() async {
    List<ProductModel> productData = [];
    http.Response res =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));

    final d = jsonDecode(res.body);
    for (var e in d) {
      productData.add(ProductModel.fromJson(e));
    }
    return productData;
  }

  static Future<List<CategoryModel>> fetchAllCategories() async {
    List<CategoryModel> categoryList = [];
    http.Response res = await http
        .get(Uri.parse("https://fakestoreapi.com/products/categories"));

    final categoryData = jsonDecode(res.body) as List<dynamic>;
    for (var category in categoryData) {
      categoryList.add(CategoryModel(
          id: category.toString(), name: category.toString().toUpperCase()));
    }
    return categoryList;
  }

  static Future<List<ProductModel>> getProductFromCategoryId(
      {required String id}) async {
    List<ProductModel> productList = [];
    http.Response res = await http
        .get(Uri.parse("https://fakestoreapi.com/products/category/$id"));

    final d = jsonDecode(res.body);
    for (var e in d) {
      productList.add(ProductModel.fromJson(e));
    }
    return productList;
  }

  /// Add product to user specific cart.
  static Future<dynamic> addProductToCart(ProductModel product) async {
    final _fireStore = FirebaseFirestore.instance;

    final userRef = _fireStore.collection(FirestoreCollections.users).doc();
    await userRef.collection(FirestoreCollections.cart).add(product.toJson());
  }
}
