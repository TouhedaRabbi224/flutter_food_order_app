import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/foods.dart';
import './food_item.dart';

class FoodsGrid extends StatelessWidget {
  const FoodsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Foods>(context);
    final products = productsData.items;

    return GridView.builder(
      itemCount: products.length,
      itemBuilder: (context, i) => ChangeNotifierProvider(
        create: (_) => products[i],
        child: FoodItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
//SilverGridDeligateWithFixedCrossAxisAccount