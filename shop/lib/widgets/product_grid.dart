import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_items.dart';
import '../providers/product_provider.dart';

class ProductGrid extends StatelessWidget {
  final showFavourite;
  ProductGrid(this.showFavourite);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavourite ? productsData.favouriteProduct : productsData.items;
    return GridView.builder(
      padding: EdgeInsets.all(8),
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
          value: products[index],
          child: ProductItem(),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
    );
  }
}
