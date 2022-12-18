import 'package:flutter/material.dart';
//import 'package:food_order_app/providers/cart.dart';
import 'package:food_order_app/widget/cart_item.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart' as Cart;

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart.Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          //----------------totalAmount---------------
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  //Chip(label: Text('৳${cart.totalAmount.toStringAsFixed(2)}',
                  Chip(
                    label: Text(
                      '৳${cart.totalAmount.toStringAsFixed(2)}',
                      style:
                          TextStyle(color: Theme.of(context).primaryColorDark),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //----------List Item --------------
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, i) => CartItem(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
