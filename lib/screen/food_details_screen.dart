import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:food_app_using_provider/models/food.dart';
import 'package:food_order_app/providers/foods.dart';

class FooDetailScreen extends StatelessWidget {
  static const routeName = '/food_Detail';

  FooDetailScreen();

  @override
  Widget build(BuildContext context) {
    final itemId = ModalRoute.of(context)?.settings.arguments as String;

    final foodData = Provider.of<Foods>(context);
    final food = foodData.findById(itemId);

    return Scaffold(
      appBar: AppBar(title: Text(food.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.asset(food.imgUrl),
            ),
            SizedBox(height: 10),
            Text(
              '\$${food.price}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                food.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
