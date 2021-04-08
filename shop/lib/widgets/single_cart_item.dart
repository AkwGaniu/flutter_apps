import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class SingleCartItem extends StatelessWidget {
  final String id;
  final String cartItemId;
  final double price;
  final String title;
  final int quantity;

  SingleCartItem(
      {this.id, this.cartItemId, this.title, this.price, this.quantity});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 10),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
      ),
      confirmDismiss: (dismissDirection) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(
              'Comfirm Delete',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[500],
              ),
            ),
            content: Text(
              'Are you sure you want to delete this cart entry?',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
            elevation: 5,
            actions: [
              // ignore: deprecated_member_use
              FlatButton(onPressed: () {
                Navigator.of(ctx).pop(false);
              }, child: Text('No')),
              FlatButton(onPressed: () {
                Navigator.of(ctx).pop(true);
              }, child: Text('yes'))
            ],
          ),
        );
      },
      onDismissed: (direction) {
        Provider.of<Carts>(context, listen: false).deleteItem(cartItemId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: FittedBox(
                child: Text('\$$price'),
              ),
            ),
          ),
          title: Text(title),
          subtitle: Text('Total: \$${(price * quantity)}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
