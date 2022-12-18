import 'package:flutter/material.dart';
import 'package:food_order_app/screen/add_item.dart';
import 'package:food_order_app/widget/app_drawer.dart';
import 'package:food_order_app/widget/used_food_item.dart';
import 'package:provider/provider.dart';
import 'package:food_order_app/providers/foods.dart';
//import 'package:food_order_app/providers/food.dart';

class FoodlistScreen extends StatelessWidget {
  static const routeName = '/food-list';

  @override
  Widget build(BuildContext context) {
    final foodData = Provider.of<Foods>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Foods'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddItem.routeName);
              },
              icon: Icon(Icons.add))
        ],
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: foodData.items.length,
        itemBuilder: (_, i) => Column(
          children: [
            UserFoodItem(
              foodData.items[i],
            ),
          ],
        ),
      ),
    );
  }
}
