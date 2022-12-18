import 'package:flutter/material.dart';
import 'package:food_order_app/providers/cart.dart';
import 'package:food_order_app/screen/cart_screen.dart';
import 'package:food_order_app/widget/app_drawer.dart';
import 'package:food_order_app/widget/badge.dart';
import 'package:food_order_app/widget/app_drawer.dart';
import 'package:provider/provider.dart';

import '../widget/food_grid.dart';

class FoodsOverviewScreen extends StatelessWidget {
  const FoodsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Order'),
        actions: [
          Consumer<Cart>(
            builder: (context, cart, child) => Badge(
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
              value: cart.itemCount.toString(),
              color: Colors.pink,
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: FoodsGrid(),
    );
  }
}
