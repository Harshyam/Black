import 'package:black/domain/category_model.dart';
import 'package:black/domain/productModel.dart';
import 'package:flutter/foundation.dart';
import '../../services/apiServices.dart/call_api.dart';

class CategoryProvider extends ChangeNotifier {
  List<CategoryModel> categoryList = [];
  List<ProductModel> productsByCategoryId = [];

  Future<void> fetchAllCategories() async {
    categoryList = await ApiCalling.fetchAllCategories();
    notifyListeners();
  }

  Future<void> getProductByCategoryId({required String id}) async {
    productsByCategoryId = await ApiCalling.getProductFromCategoryId(id: id);
    notifyListeners();
  }
}
