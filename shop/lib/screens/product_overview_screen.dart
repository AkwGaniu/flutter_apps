import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

import '../screens/cart_screen.dart';
import '../widgets/drawer.dart';
import '../widgets/badge.dart';
import '../widgets/product_grid.dart';

enum ProductFilter { Favourite, All }

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavouriteProduct = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('Show Favourite'),
                  value: ProductFilter.Favourite,
                ),
                PopupMenuItem(
                  child: Text('Show Favourite'),
                  value: ProductFilter.All,
                )
              ];
            },
            onSelected: (ProductFilter selectedValue) {
              setState(() {
                if (selectedValue == ProductFilter.Favourite) {
                  _showOnlyFavouriteProduct = true;
                } else {
                  _showOnlyFavouriteProduct = false;
                }
              });
            },
          ),
          Consumer<Carts>(builder: (context, cartItem, ch) =>  Badge(
            child: ch,
            value: cartItem.cartItemCount.toString(),
          ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductGrid(_showOnlyFavouriteProduct),
    );
  }
}
