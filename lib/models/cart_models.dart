import 'package:shamo/models/product_models.dart';

class CartModel {
  late int id;
  late ProductModel product;
  late int quantity;

  CartModel({
    required this.id,
    required this.product,
    required this.quantity,
  });

  CartModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    product = ProductModel.fromJson(json['product']);
    quantity = json['quantity'];
  }

  // Function to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  // Total price
  double getTotalPrice() {
    return product.price * quantity;
  }
}
