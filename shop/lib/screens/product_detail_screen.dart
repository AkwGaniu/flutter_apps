import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = 'product_detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments; // This is the product id
    final singleProduct =
        Provider.of<Products>(context, listen: false).getProductById(productId);

    return Scaffold(
        appBar: AppBar(
          title: Text(singleProduct.title),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Image.network(
                singleProduct.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 20),
            Text(singleProduct.title, style: TextStyle(fontSize: 20),),
            SizedBox(height: 20),
            Text(singleProduct.price.toString()),
            SizedBox(height: 20),
            Text(singleProduct.description),
          ],
        )));
  }
}
