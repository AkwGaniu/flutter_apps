import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/product_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/product_provider.dart';
import './providers/cart_provider.dart';
import './providers/order_provider.dart';
import './screens/cart_screen.dart';
import './screens/order_screen.dart';
import './screens/manage_products_screen.dart';
import './screens/edit_product_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Products()),
        ChangeNotifierProvider(create: (context) => Carts(),),
        ChangeNotifierProvider(create: (context) => Orders(),)
      ],    
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrangeAccent,
          fontFamily: 'Lato',
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white))
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
          ManagePrductScreen.routeName: (ctx) => ManagePrductScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
        }
      ),
    );
  }
}

