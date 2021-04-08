import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/manage_product_single_product.dart';
import '../widgets/drawer.dart';
import '../providers/product_provider.dart';
import '../screens/edit_product_screen.dart';

class ManagePrductScreen extends StatelessWidget {
  static const routeName = '/manage_products';
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: productData.items.length,
        itemBuilder: (_, i) => Column(
          children: [
            SingleUserProduct(
              productData.items[i].title,
              productData.items[i].imageUrl,
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
