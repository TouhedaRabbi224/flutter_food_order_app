import 'package:flutter/material.dart';
import 'package:food_order_app/providers/food.dart';
import 'package:food_order_app/providers/cart.dart';
import 'package:provider/provider.dart';

import '../providers/food.dart';
import '../screen/food_details_screen.dart';

class FoodItem extends StatelessWidget {
  FoodItem();

  @override
  Widget build(BuildContext context) {
    //final food = Provider.of<Food>(context);
    final cart = Provider.of<Cart>(context, listen: false);

    return Consumer<Food>(
      builder: (context, food, child) => ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                FooDetailScreen.routeName,
                arguments: food.id,
              );
            },
            child: Image.asset(
              food.imgUrl,
              fit: BoxFit.fitHeight,
            ),
          ),
          //--------------footer----------//
          footer: GridTileBar(
            backgroundColor: Colors.black26,
            leading: IconButton(
              icon: Icon(
                  food.is_favourite ? Icons.favorite : Icons.favorite_outline),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                food.toggoleFavouriteData();
              },
            ),
            title: Text(
              food.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                cart.addItem(
                  food.id,
                  food.price,
                  food.title,
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text('Added new Item:)', textAlign: TextAlign.center),
                    duration: Duration(seconds: 4),
                    action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        cart.removeItem(food.id);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
