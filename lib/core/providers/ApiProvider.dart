import 'package:flutter/foundation.dart';

import '../../domain/productModel.dart';
import '../../services/apiServices.dart/call_api.dart';

class ApiProvider extends ChangeNotifier {
  List<ProductModel> productList = [];

  Future<void> productApi() async {
    productList = await ApiCalling.loadApiData();
    notifyListeners();
  }
}
