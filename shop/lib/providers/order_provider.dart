import 'package:flutter/foundation.dart';
import '../models/order.dart';
import '../models/cart.dart';

class Orders with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  void addOrder (List<CartItem> products, double total) {
    _orders.insert(0, Order(
      id: DateTime.now().toString(),
      products: products,
      amount: total,
      timeCreated: DateTime.now()
    ));

    notifyListeners();
  }
}