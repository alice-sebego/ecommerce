import 'package:flutter/material.dart';
import '../models/cartItem.model.dart';
import '../models/product.model.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(Product product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    // if the product is already in the cart
    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeItem(Product product) {
    _items.removeWhere((item) => item.product.id == product.id);
    notifyListeners();
  }

  void updateQuantity(Product product, int quantity) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _items[index].quantity = quantity;
      notifyListeners();
    }
  }

  double get totalPrice {
    return _items.fold(
        0.0, (total, item) => total + item.product.price * item.quantity);
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
