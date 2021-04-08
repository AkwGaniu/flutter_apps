import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Carts>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Consumer<Product>(
            builder: (context, _, child) => IconButton(
              icon: Icon(
                product.isFavourite
                    ? Icons.favorite_outlined
                    : Icons.favorite_outline,
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                product.toggleFavourite();
              },
            ),
            child: Text(''), //We are not using this at the moment
          ),
          title: FittedBox(
              child: Text(
            product.title,
            textAlign: TextAlign.center,
          )),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {
              cart.addToCart(
                product.id,
                product.title,
                product.price,
              );
              // ignore: deprecated_member_use
              Scaffold.of(context).hideCurrentSnackBar();
              // ignore: deprecated_member_use
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Ited added to cart!'),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      cart.removeSingleItem(product.id);
                    },
                  ),
                  duration: Duration(seconds: 3),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
