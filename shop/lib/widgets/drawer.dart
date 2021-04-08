import 'package:flutter/material.dart';
import 'package:shop/screens/manage_products_screen.dart';

import '../screens/order_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello Buddy!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text(
              'Shop',
              style: TextStyle(color: Colors.black54, fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text(
              'Orders',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text(
              'Manage Products',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(ManagePrductScreen.routeName);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
