import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/order.dart';

class SingleOrderItem extends StatefulWidget {
  final Order orderItem;
  bool _expand = false;

  SingleOrderItem(this.orderItem);

  @override
  _SingleOrderItemState createState() => _SingleOrderItemState();
}

class _SingleOrderItemState extends State<SingleOrderItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
              title: Text(widget.orderItem.amount.toString()),
              subtitle: Text(DateFormat('dd/MM/yyyy hh:mm')
                  .format(widget.orderItem.timeCreated)),
              trailing: IconButton(
                icon: Icon(
                    widget._expand ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    widget._expand = !widget._expand;
                  });
                },
              )),
          if (widget._expand)
            Container(
              height: min(widget.orderItem.products.length * 10.0 + 100, 100),
              child: ListView(
                children: widget.orderItem.products
                    .map(
                      (prod) => Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text(
                            prod.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${prod.quantity}x \$${prod.price}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ]),
                      ),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
