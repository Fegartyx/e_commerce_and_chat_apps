import 'package:e_commerce_and_chat_apps/models/product_model.dart';

class CartModel {
  late int id;
  ProductModel? productModel;
  late int quantity;

  CartModel({
    required this.id,
    this.productModel,
    required this.quantity,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productModel = ProductModel.fromJson(json['product']);
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': productModel!.toJson(),
      'quantity': quantity,
    };

    double getTotalPrice() {
      return productModel!.price * quantity;
    }
  }
}
