import 'package:flutter/foundation.dart';

import '../models/cart.dart';

class Carts with ChangeNotifier {
  Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartItems {
    return {..._cartItems};
  }

  int get cartItemCount {
    int count = 0;
    _cartItems.forEach((key, value) { 
      count += value.quantity;
    });
    return count;
  }

    double get getTotalPrice {
    double totalPrice = 0;
    _cartItems.forEach((key, cartItem) { 
      totalPrice += cartItem.price * cartItem.quantity;
    });
    return totalPrice;
  }

  void addToCart(String prodId, String title, double price) {
    if (_cartItems.containsKey(prodId)) {
      // Increment quantity
      _cartItems.update(
        prodId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1
        )
      );
    } else {
      _cartItems.putIfAbsent(
        prodId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1
        ),
      );
    }
    notifyListeners();
  }

  void deleteItem (prodId) {
    _cartItems.remove(prodId);
    notifyListeners();
  }

  void removeSingleItem (prodId) {
    if (!_cartItems.containsKey(prodId)) return;
    if (_cartItems[prodId].quantity > 1) {
      _cartItems.update(
        prodId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity - 1
        )
      );
    } else {
      _cartItems.remove(prodId);
    }
    notifyListeners();
  }

  void clearCart () {
    _cartItems.clear();
    notifyListeners();
  }
}
