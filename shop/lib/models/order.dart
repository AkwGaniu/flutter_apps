import './cart.dart';

class Order {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime timeCreated;

  Order({ this.id, this.amount, this.products, this.timeCreated });
}