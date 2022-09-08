import 'package:e_commerce_and_chat_apps/models/product_model.dart';
import 'package:e_commerce_and_chat_apps/services/product_service.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];

  // getter
  List<ProductModel> get products => _products;
  // setter
  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProducts();
      _products = products;
      for (var pro in _products) {
        print(pro.id);
      }
    } catch (e) {
      print(e);
    }
  }
}
