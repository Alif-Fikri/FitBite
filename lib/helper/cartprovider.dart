import 'package:flutter/material.dart';
import 'package:fitbite/helper/cartitem.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;
  

  void addToCart(CartItem item) {
    final existingIndex = _cartItems.indexWhere((i) => i.name == item.name);
    if (existingIndex != -1) {
      _cartItems[existingIndex].quantity++;
    } else {
      _cartItems.add(item);
    }
    notifyListeners();
  }

  void updateQuantity(CartItem item, bool increase) {
    if (increase) {
      item.quantity += 1;
    } else {
      if (item.quantity > 1) {
        item.quantity -= 1;
      } else {
        _cartItems.remove(item);
      }
    }
    notifyListeners();
  }

  int calculateSubtotal() {
    return _cartItems.fold(
        0, (sum, item) => sum + (item.price * item.quantity));
  }

  int calculateTotalCalories() {
    return _cartItems.fold(
        0, (sum, item) => sum + (item.calories * item.quantity));
  }
  int get totalItems => _cartItems.fold(0, (sum, item) => sum + item.quantity);

}

