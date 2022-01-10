import 'package:flutter/cupertino.dart';
import 'package:shamo/models/cart_models.dart';
import 'package:shamo/models/product_models.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  // Getter Setter
  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  // Function add cart
  addCart(ProductModel product) {
    if (productExist(product)) {
      int index =
          _carts.indexWhere((element) => element.product.id == product.id);
      _carts[index].quantity++;
    } else {
      _carts.add(
        CartModel(
          id: _carts.length,
          product: product,
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }

  // Function Remove
  removeCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  // Function add quantity
  addQuantity(int id) {
    _carts[id].quantity++;
    notifyListeners();
  }

  // Function reduse quantity
  reduceQuantity(int id) {
    _carts[id].quantity--;
    if (_carts[id].quantity == 0) {
      _carts.removeAt(id);
    }
    notifyListeners();
  }

  // Count total item
  totalItem() {
    int total = 0;
    for (var item in _carts) {
      total += item.quantity;
    }
    return total;
  }

  // Count total price
  totalPrice() {
    double total = 0;
    for (var item in _carts) {
      total += (item.quantity * item.product.price);
    }
    return total;
  }

  // Check
  productExist(ProductModel product) {
    if (_carts.indexWhere((element) => element.product.id == product.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
