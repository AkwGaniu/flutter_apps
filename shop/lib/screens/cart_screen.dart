import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../providers/order_provider.dart';
import '../widgets/single_cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Carts>(context);
    print({'cart.cartItems': cart.cartItems});
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(
                10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.getTotalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                        cart.cartItems.values.toList(),
                        cart.getTotalPrice,
                      );
                      cart.clearCart();
                    },
                    child: Text(
                      'CHECK OUT',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.cartItems.length,
              itemBuilder: (context, index) => SingleCartItem(
                id: cart.cartItems.values.toList()[index].id,
                cartItemId: cart.cartItems.keys.toList()[index],
                title: cart.cartItems.values.toList()[index].title,
                price: cart.cartItems.values.toList()[index].price,
                quantity: cart.cartItems.values.toList()[index].quantity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
